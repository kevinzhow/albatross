@testable import App
import XCTVapor
import Foundation

extension DateFormatter {
    static func createGithubDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:sszzz"
        return dateFormatter
    }
}

final class AppTests: XCTestCase {
    func testComment() throws {
        
        guard let url = Bundle.module.url(forResource: "createComment", withExtension: "json") else {
            throw Abort(.notFound)
        }
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.createGithubDateFormatter())
        
        let event = try decoder.decode(GithubIssueCommentEvent.self, from: data)
        print(FeishuEvent.createGithubCommentIssueEvent(event: event))
    }
    
    func testPush() throws {
        
        guard let url = Bundle.module.url(forResource: "push", withExtension: "json") else {
            throw Abort(.notFound)
        }
        let data = try Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.createGithubDateFormatter())
        
        let event = try decoder.decode(GithubPushEvent.self, from: data)
        print(FeishuEvent.createGithubPushEvent(event: event))
    }
    
    func testPush2() throws {
        
        guard let url = Bundle.module.url(forResource: "push2", withExtension: "json") else {
            throw Abort(.notFound)
        }
        let data = try Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.createGithubDateFormatter())
        
        let event = try decoder.decode(GithubPushEvent.self, from: data)
        print(FeishuEvent.createGithubPushEvent(event: event))
    }
    
    func testCreateEvent() throws {
        
        guard let url = Bundle.module.url(forResource: "createEvent", withExtension: "json") else {
            throw Abort(.notFound)
        }
        let data = try Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.createGithubDateFormatter())
        
        let event = try decoder.decode(GithubCreateEvent.self, from: data)
        print(FeishuEvent.createFromGithubCreateEvent(event: event))
    }
    
    func testIssueEvent() throws {
        
        guard let url = Bundle.module.url(forResource: "issueEvent", withExtension: "json") else {
            throw Abort(.notFound)
        }
        let data = try Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.createGithubDateFormatter())
        
        let event = try decoder.decode(GithubIssueEvent.self, from: data)
        print(FeishuEvent.createFromGithubIssueEvent(event: event))
    }
    
    func testCommitCommentEvent() throws {
        
        guard let url = Bundle.module.url(forResource: "commitComment", withExtension: "json") else {
            throw Abort(.notFound)
        }
        let data = try Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.createGithubDateFormatter())
        
        let event = try decoder.decode(GithubCommitCommentEvent.self, from: data)
        print(FeishuEvent.createGithubCommitCommentEvent(event: event))
    }
    
    func testPullRequestEvent() throws {
        
        guard let url = Bundle.module.url(forResource: "pullRequest", withExtension: "json") else {
            throw Abort(.notFound)
        }
        let data = try Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.createGithubDateFormatter())
        
        let event = try decoder.decode(GithubPullRequestEvent.self, from: data)
        print(FeishuEvent.createFromGithubPullRequestEvent(event: event))
    }
    
    func testPullRequestReviewComment() throws {
        
        guard let url = Bundle.module.url(forResource: "pullrequestReviewComment", withExtension: "json") else {
            throw Abort(.notFound)
        }
        let data = try Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.createGithubDateFormatter())
        
        let event = try decoder.decode(GithubPullRequestReviewCommentEvent.self, from: data)
        print(FeishuEvent.createGithubPullRequestReviewCommentEvent(event: event))
    }
}
