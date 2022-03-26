import Fluent
import Vapor
import SwiftyJSON

struct FeishuController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("hook", "feishu")
        todos.get(use: index)
        todos.post(use: create)
        todos.group(":webhookID") { webhook in
            webhook.delete(use: delete)
            webhook.post(use: forward)
        }
    }

    func index(req: Request) async throws -> [Todo] {
        try await Todo.query(on: req.db).all()
    }
    
    func forward(req: Request) async throws -> HTTPStatus {
        
        var feishuEvent: FeishuEvent?
        
        if let githubPush = try? req.content.decode(GithubPushEvent.self) {
            feishuEvent = FeishuEvent.createGithubPushEvent(event: githubPush)
        } else {
            guard let githubEvent = try? req.content.decode(GithubIssueEvent.self) else {
                return .notAcceptable
            }
            
            if githubEvent.action == "deleted" {
                return .ok
            }
            
            feishuEvent = FeishuEvent.createGithubCommentIssueEvent(event: githubEvent)
        }
        
        guard let feishuEvent = feishuEvent else {
            return .notAcceptable
        }

        let _ = try await req.client.post("https://open.feishu.cn/open-apis/bot/v2/hook/bf70bd6e-ae83-458b-9a4d-f5d433baa2e1") { req in
            try req.content.encode(feishuEvent)
        }
        return .ok
    }

    func create(req: Request) async throws -> Todo {
        let todo = try req.content.decode(Todo.self)
        try await todo.save(on: req.db)
        return todo
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let todo = try await Todo.find(req.parameters.get("todoID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await todo.delete(on: req.db)
        return .ok
    }
}
