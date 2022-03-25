@testable import App
import XCTVapor
import SwiftyJSON

final class AppTests: XCTestCase {
    func testHelloWorld() throws {
        
        guard let url = Bundle.module.url(forResource: "createComment", withExtension: "json") else {
            throw Abort(.notFound)
        }
        let data = try Data(contentsOf: url)
        
        let json = try JSON(data: data)
        print(json["action"])
        print(json["issue"])
        print(json["comment"]["body"])
        
        let issueName = json["issue"]["title"]
        let issueNumber = json["issue"]["number"]
        
        let title = "\(json["repository"]["name"]) #\(issueNumber) \(issueName)"
        
        let comment = json["comment"]["body"]
        
        let username = json["sender"]["login"]
        print(json["sender"]["login"])
        
        print("\(title)")
        print("\(username) says \(comment)")
    }
}
