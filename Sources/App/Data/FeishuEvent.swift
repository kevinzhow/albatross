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
        let href: URL?
    }
}

extension FeishuEvent {
    static func createGithubCommentIssueEvent(json: JSON) -> FeishuEvent {
        let issueName = json["issue"]["title"]
        let issueNumber = json["issue"]["number"]
        
        let title = "\(json["repository"]["name"]) #\(issueNumber) \(issueName)"
        
        let comment = json["comment"]["body"]
        
        let username = json["sender"]["login"]
        
        return FeishuEvent(msgType: "post", content: FeishuEvent.Content(post: FeishuEvent.Content.Post(zhCN: FeishuEvent.Content.Post.ZhCN(title: title, content: [[FeishuEvent.Content.Post.ZhCN.Content(tag: "text", text: "\(username): \(comment)", href: nil)]]))))
    }
}
