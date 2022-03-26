import Fluent
import FluentSQLiteDriver
import Leaf
import Vapor
import CryptoSwift

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.sqlite(.file(Environment.get("DB_URL") ?? "db.sqlite")), as: .sqlite)

    app.migrations.add(CreateFeishuWebhook())

    app.views.use(.leaf)
    
    app.routes.defaultMaxBodySize = "500kb"
    
    // Admin

    let adminPassword = Environment.get("ADMIN_PASSWORD") ?? "albatross"
    app.adminConfig = AdminConfiguration(username: Environment.get("ADMIN_USERNAME") ?? "albatross", password: adminPassword.md5())

    // register routes
    try routes(app)
}
