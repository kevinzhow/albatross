import Fluent

struct CreateFeishuWebhook: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(FeishuWebhookHandler.schema)
            .id()
            .field("title", .string, .required)
            .field("url", .string, .required)
            .field("secret", .string)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema(FeishuWebhookHandler.schema).delete()
    }
}
