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

    func index(req: Request) async throws -> [FeishuWebhook] {
        try await FeishuWebhook.query(on: req.db).all()
    }
    
    func forward(req: Request) async throws -> HTTPStatus {
        
        guard let GITHUB_EVENT = req.headers.first(name: "X-GitHub-Event") else {
            return .notAcceptable
        }
        
        var feishuEvent: FeishuEvent?
        
        switch GITHUB_EVENT {
        case "issues":
            if let event = try? req.content.decode(GithubIssueEvent.self) {
                feishuEvent = FeishuEvent.createFromGithubIssueEvent(event: event)
            }
        case "issue_comment":
            if let event = try? req.content.decode(GithubIssueCommentEvent.self) {
                if event.action == "deleted" {
                    return .ok
                }
                feishuEvent = FeishuEvent.createGithubCommentIssueEvent(event: event)
            }
        case "commit_comment":
            if let event = try? req.content.decode(GithubCommitCommentEvent.self) {
                feishuEvent = FeishuEvent.createGithubCommitCommentEvent(event: event)
            }
        case "pull_request":
            if let event = try? req.content.decode(GithubPullRequestEvent.self) {
                feishuEvent = FeishuEvent.createFromGithubPullRequestEvent(event: event)
            }
        case "create":
            if let event = try? req.content.decode(GithubCreateEvent.self) {
                feishuEvent = FeishuEvent.createFromGithubCreateEvent(event: event)
            }
        case "push":
            if let event = try? req.content.decode(GithubPushEvent.self) {
                feishuEvent = FeishuEvent.createGithubPushEvent(event: event)
            }
        default:
            return .notAcceptable
        }
        
        guard let feishuEvent = feishuEvent else {
            return .notAcceptable
        }

        let _ = try await req.client.post("https://open.feishu.cn/open-apis/bot/v2/hook/bf70bd6e-ae83-458b-9a4d-f5d433baa2e1") { req in
            try req.content.encode(feishuEvent)
        }
        return .ok
    }

    func create(req: Request) async throws -> FeishuWebhook {
        let todo = try req.content.decode(FeishuWebhook.self)
        try await todo.save(on: req.db)
        return todo
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let todo = try await FeishuWebhook.find(req.parameters.get("todoID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await todo.delete(on: req.db)
        return .ok
    }
}
