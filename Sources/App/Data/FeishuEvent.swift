import Vapor
import SwiftyJSON

struct FeishuEvent: Codable, Content {
    let msgType: String
    let content: Content

    private enum CodingKeys: String, CodingKey {
        case msgType = "msg_type"
        case content
    }
}

extension FeishuEvent {
    struct Content: Codable {
        let post: Post
    }
}

extension FeishuEvent.Content {
    struct Post: Codable {
        let zhCN: ZhCN

        private enum CodingKeys: String, CodingKey {
            case zhCN = "zh-CN"
        }
    }
}

extension FeishuEvent.Content.Post {
    struct ZhCN: Codable {
        let title: String
        let content: [[Content]]
    }
}

extension FeishuEvent.Content.Post.ZhCN {
    struct Content: Codable {
        let tag: String
        let text: String
        let href: String?
    }
}

extension FeishuEvent {
    static func createGithubCommentIssueEvent(event: GithubIssueCommentEvent) -> FeishuEvent {
        let issueName = event.issue.title
        let issueNumber = event.issue.number
        let issueURL = event.issue.url.absoluteString
        
        let title = event.repository.name
        
        let comment =  event.comment.body
        let commentURL = event.comment.url.absoluteString
        
        let username = event.sender.login
        
        return FeishuEvent(msgType: "post", content: FeishuEvent.Content(post: FeishuEvent.Content.Post(zhCN: FeishuEvent.Content.Post.ZhCN(title: title, content: [
            [FeishuEvent.Content.Post.ZhCN.Content(tag: "a", text: "#\(issueNumber) \(issueName)", href: issueURL)],
            [FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "\(username):", href: nil),
             FeishuEvent.Content.Post.ZhCN.Content(tag: "a", text: "\(comment)", href: commentURL)
            ],
        ]))))
    }
    
    static func createGithubPushEvent(event: GithubPushEvent) -> FeishuEvent {
        
        let title = event.repository.name
        
        var feishuContent: [[FeishuEvent.Content.Post.ZhCN.Content]] = []
        
        feishuContent.append([FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "branch \(event.ref)", href: nil)])
        
        for commit in event.commits {
            feishuContent.append([
                FeishuEvent.Content.Post.ZhCN.Content(tag: "a", text: commit.message, href: commit.url.absoluteString),
                FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: " - ", href: nil),
                FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "author \(commit.author.name)", href: nil)
            ])
        }
//
//        let pusher = event.pusher.name
//
//        feishuContent.append([FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "from \(pusher):", href: nil)])
        
        return FeishuEvent(msgType: "post", content: FeishuEvent.Content(post: FeishuEvent.Content.Post(zhCN: FeishuEvent.Content.Post.ZhCN(title: title, content: feishuContent))))
    }
    
    static func createFromGithubCreateEvent(event: GithubCreateEvent) -> FeishuEvent {
        
        let title = event.repository.name
        
        var feishuContent: [[FeishuEvent.Content.Post.ZhCN.Content]] = []
        
        feishuContent.append([
            FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "New Branch created by ", href: nil),
            FeishuEvent.Content.Post.ZhCN.Content(tag: "a", text: "@\(event.sender.login):", href: event.sender.url.absoluteString)
        ])
        
        feishuContent.append([
            FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "\(event.ref)", href: event.repository.url.absoluteString)
        ])
//
//        let pusher = event.pusher.name
//
//        feishuContent.append([FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "from \(pusher):", href: nil)])
        
        return FeishuEvent(msgType: "post", content: FeishuEvent.Content(post: FeishuEvent.Content.Post(zhCN: FeishuEvent.Content.Post.ZhCN(title: title, content: feishuContent))))
    }
    
    static func createFromGithubIssueEvent(event: GithubIssueEvent) -> FeishuEvent {
        
        let title = event.repository.name
        
        var feishuContent: [[FeishuEvent.Content.Post.ZhCN.Content]] = []
        
        feishuContent.append([
            FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "New Issue created by ", href: nil),
            FeishuEvent.Content.Post.ZhCN.Content(tag: "a", text: "@\(event.sender.login):", href: event.sender.url.absoluteString)
        ])
        
        feishuContent.append([
            FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "\(event.issue.title)", href: event.issue.url.absoluteString)
        ])
//
//        let pusher = event.pusher.name
//
//        feishuContent.append([FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "from \(pusher):", href: nil)])
        
        return FeishuEvent(msgType: "post", content: FeishuEvent.Content(post: FeishuEvent.Content.Post(zhCN: FeishuEvent.Content.Post.ZhCN(title: title, content: feishuContent))))
    }
}
