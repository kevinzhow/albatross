import Vapor

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
//        let issueURL = event.issue.htmlURL.absoluteString
        
        let title = event.repository.name
        
        let comment =  event.comment.body
        let commentURL = event.comment.htmlURL.absoluteString
        
        let username = event.sender.login
        
        return FeishuEvent(msgType: "post", content: FeishuEvent.Content(post: FeishuEvent.Content.Post(zhCN: FeishuEvent.Content.Post.ZhCN(title: title, content: [
            [
                FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "Comment \(event.action) on ", href: nil),
                FeishuEvent.Content.Post.ZhCN.Content(tag: "a", text: "#\(issueNumber) \(issueName) ", href: commentURL),
                FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "by \(username)", href: event.sender.htmlURL.absoluteString),
            ],
            [
             FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "\(comment)", href: nil)
            ],
        ]))))
    }
    
    static func createGithubCommitCommentEvent(event: GithubCommitCommentEvent) -> FeishuEvent {
        let title = event.repository.name
        
        let comment =  event.comment.body
//        let commentURL = event.comment.htmlURL.absoluteString
        
        let username = event.sender.login
        
        return FeishuEvent(msgType: "post", content: FeishuEvent.Content(post: FeishuEvent.Content.Post(zhCN: FeishuEvent.Content.Post.ZhCN(title: title, content: [
            [
                FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "Comment \(event.action) on ", href: nil),
                FeishuEvent.Content.Post.ZhCN.Content(tag: "a", text: "\(event.comment.path!) line #\(event.comment.line!)", href: event.comment.htmlURL.absoluteString),
                FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: " by ", href: nil),
                FeishuEvent.Content.Post.ZhCN.Content(tag: "a", text: "@\(username)", href: event.sender.htmlURL.absoluteString),
            ],
            [
                FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "\(comment)", href: nil)
            ],
        ]))))
    }
    
    static func createGithubPushEvent(event: GithubPushEvent) -> FeishuEvent {
        
        let title = event.repository.name
        
        var feishuContent: [[FeishuEvent.Content.Post.ZhCN.Content]] = []
        
        feishuContent.append([FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "Push on branch \(event.ref)", href: nil)])
        
        for commit in event.commits {
            feishuContent.append([
                FeishuEvent.Content.Post.ZhCN.Content(tag: "a", text: "\(commit.id.prefix(7)) ", href: commit.url.absoluteString),
                FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: commit.message, href: nil),
                FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: " by ", href: nil),
                FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "\(commit.author.name)", href: nil)
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
            FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "New \(event.refType) created by ", href: nil),
            FeishuEvent.Content.Post.ZhCN.Content(tag: "a", text: "@\(event.sender.login):", href: event.sender.htmlURL.absoluteString)
        ])
        
        feishuContent.append([
            FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "\(event.ref)", href: event.repository.htmlURL.absoluteString)
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
            FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "Issue \(event.action) by ", href: nil),
            FeishuEvent.Content.Post.ZhCN.Content(tag: "a", text: "@\(event.sender.login):", href: event.sender.htmlURL.absoluteString)
        ])
        
        feishuContent.append([
            FeishuEvent.Content.Post.ZhCN.Content(tag: "a", text: "#\(event.issue.number) \(event.issue.title)", href: event.issue.htmlURL.absoluteString)
        ])
        
        feishuContent.append([
            FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "\(event.issue.body)", href: nil)
        ])
//
//        let pusher = event.pusher.name
//
//        feishuContent.append([FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "from \(pusher):", href: nil)])
        
        return FeishuEvent(msgType: "post", content: FeishuEvent.Content(post: FeishuEvent.Content.Post(zhCN: FeishuEvent.Content.Post.ZhCN(title: title, content: feishuContent))))
    }
    
    static func createFromGithubPullRequestEvent(event: GithubPullRequestEvent) -> FeishuEvent {
        
        let title = event.repository.name
        
        var feishuContent: [[FeishuEvent.Content.Post.ZhCN.Content]] = []
        
        feishuContent.append([
            FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "Pull Request \(event.action) by ", href: nil),
            FeishuEvent.Content.Post.ZhCN.Content(tag: "a", text: "@\(event.sender.login):", href: event.sender.htmlURL.absoluteString)
        ])
        
        feishuContent.append([
            FeishuEvent.Content.Post.ZhCN.Content(tag: "a", text: "#\(event.number) \(event.pullRequest.title)", href: event.pullRequest.htmlURL.absoluteString)
        ])
        
        if let body = event.pullRequest.body {
            feishuContent.append([
                FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: body, href: nil)
            ])
        }
//
//        let pusher = event.pusher.name
//
//        feishuContent.append([FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "from \(pusher):", href: nil)])
        
        return FeishuEvent(msgType: "post", content: FeishuEvent.Content(post: FeishuEvent.Content.Post(zhCN: FeishuEvent.Content.Post.ZhCN(title: title, content: feishuContent))))
    }
    
    static func createGithubPullRequestReviewCommentEvent(event: GithubPullRequestReviewCommentEvent) -> FeishuEvent {
        let title = event.repository.name
        
        let comment =  event.comment.body
//        let commentURL = event.comment.htmlURL.absoluteString
        
        let username = event.sender.login
        
        return FeishuEvent(msgType: "post", content: FeishuEvent.Content(post: FeishuEvent.Content.Post(zhCN: FeishuEvent.Content.Post.ZhCN(title: title, content: [
            [
                FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "Comment \(event.action) on ", href: nil),
                FeishuEvent.Content.Post.ZhCN.Content(tag: "a", text: "\(event.comment.path!) line #\(event.comment.line!)", href: event.comment.htmlURL.absoluteString),
                FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: " by ", href: nil),
                FeishuEvent.Content.Post.ZhCN.Content(tag: "a", text: "@\(username)", href: event.sender.htmlURL.absoluteString),
            ],
            [
                FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "\(comment)", href: nil)
            ],
        ]))))
    }
}
