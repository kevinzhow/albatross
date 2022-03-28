import Fluent
import FluentSQLiteDriver
import Leaf
import Vapor
import CryptoSwift
import NIOSSL

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.sqlite(.file(Environment.get("DB_URL") ?? "/app/data/db.sqlite")), as: .sqlite)

    app.migrations.add(CreateFeishuWebhook())

    app.views.use(.leaf)
    
    app.routes.defaultMaxBodySize = "500kb"
    
    // Check if user has ENABLE_TLS TLS_CERT and TLS_KEY enviroment
    if let enableTLS = Environment.get("ENABLE_TLS"), enableTLS == "true" {
        try app.http.server.configuration.tlsConfiguration = .makeServerConfiguration(
            certificateChain: NIOSSLCertificate.fromPEMFile(Environment.get("TLS_CERT") ?? "/app/certs/cert.pem").map { .certificate($0) },
            privateKey: .file(Environment.get("TLS_KEY") ?? "/app/certs/key.pem")
        )
    }

    // Admin

    let adminPassword = Environment.get("ADMIN_PASSWORD") ?? "albatross"
    app.adminConfig = AdminConfiguration(username: Environment.get("ADMIN_USERNAME") ?? "albatross", password: adminPassword.md5())

    // register routes
    try routes(app)
    
    try app.autoMigrate().wait()
}
