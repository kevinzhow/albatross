import Fluent
import Vapor

struct FeishuController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("hook", "feishu")
        todos.grouped([AdminPasswordAuthenticator()]).get(use: index)
        todos.grouped([AdminPasswordAuthenticator()]).post(use: create)
        todos.group(":webhookID") { webhook in
            webhook.grouped([AdminPasswordAuthenticator()]).delete(use: delete)
            webhook.post(use: forward)
        }
    }

    func index(req: Request) async throws -> [FeishuWebhookHandler] {
        try await FeishuWebhookHandler.query(on: req.db).all()
    }
    
    func forward(req: Request) async throws -> HTTPStatus {
        guard let webhook = try await FeishuWebhookHandler.find(req.parameters.get("webhookID"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        guard let GITHUB_EVENT = req.headers.first(name: "X-GitHub-Event") else {
            return .notAcceptable
        }
        
        var feishuEvent: FeishuEvent?
        
        switch GITHUB_EVENT {
        case "ping":
            return .ok
        case "pull_request_review_comment":
            if let event = try? req.content.decode(GithubPullRequestReviewCommentEvent.self) {
                feishuEvent = FeishuEvent.createGithubPullRequestReviewCommentEvent(event: event)
            }
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

        let _ = try await req.client.post("\(webhook.url)") { req in
            try req.content.encode(feishuEvent)
        }
        return .ok
    }

    func create(req: Request) async throws -> FeishuWebhookHandler {
        let todo = try req.content.decode(FeishuWebhookHandler.self)
        try await todo.save(on: req.db)
        return todo
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let todo = try await FeishuWebhookHandler.find(req.parameters.get("webhookID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await todo.delete(on: req.db)
        return .ok
    }
}
