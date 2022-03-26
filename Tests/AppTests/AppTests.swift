@testable import App
import XCTVapor
import SwiftyJSON
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
        
        let json = try JSON(data: data)
        print(FeishuEvent.createGithubCommentIssueEvent(json: json))
    }
    
    func testPush() throws {
        
        guard let url = Bundle.module.url(forResource: "push", withExtension: "json") else {
            throw Abort(.notFound)
        }
        let data = try Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.createGithubDateFormatter())
        
        let article = try decoder.decode(GithubPushEvent.self, from: data)
        print(FeishuEvent.createGithubPushEvent(event: article))
    }
}
