import Fluent
import Vapor

final class FeishuWebhookHandler: Model, Content {
    static let schema = "feishu+webhook"
    struct FieldKeys {
        static var title: FieldKey { "title" }
        static var url: FieldKey { "url" }
        static var secret: FieldKey { "secret" }
    }
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: FeishuWebhookHandler.FieldKeys.title)
    var title: String
    
    @Field(key: FeishuWebhookHandler.FieldKeys.url)
    var url: String
    
    @OptionalField(key: FeishuWebhookHandler.FieldKeys.secret)
    var secret: String?

    init() { }

    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
