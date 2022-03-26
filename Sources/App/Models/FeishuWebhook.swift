import Fluent
import Vapor

final class FeishuWebhook: Model, Content {
    static let schema = "feishu+webhook"
    struct FieldKeys {
        static var title: FieldKey { "title" }
        static var url: FieldKey { "url" }
        static var secret: FieldKey { "secret" }
    }
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: FeishuWebhook.FieldKeys.title)
    var title: String
    
    @Field(key: FeishuWebhook.FieldKeys.url)
    var url: String
    
    @OptionalField(key: FeishuWebhook.FieldKeys.secret)
    var secret: String?

    init() { }

    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
