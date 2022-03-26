import Fluent
import FluentSQLiteDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)

    app.migrations.add(CreateFeishuWebhook())

    app.views.use(.leaf)
    
    app.routes.defaultMaxBodySize = "500kb"
    

    // register routes
    try routes(app)
    
    try app.autoMigrate()
}
