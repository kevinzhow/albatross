// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "albatross",
    platforms: [
       .macOS(.v12)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/leaf.git", from: "4.0.0"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", .upToNextMinor(from: "1.4.0")),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
                .product(name: "Leaf", package: "leaf"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "CryptoSwift", package: "CryptoSwift"),
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .executableTarget(name: "Run", dependencies: [.target(name: "App")]),
        .testTarget(name: "AppTests",
                    dependencies: [
                        .target(name: "App"),
                        .product(name: "XCTVapor", package: "vapor"),
                    ],
                    resources: [
                        .copy("Resources/createComment.json"),
                        .copy("Resources/push.json"),
                        .copy("Resources/push2.json"),
                        .copy("Resources/createEvent.json"),
                        .copy("Resources/issueEvent.json"),
                        .copy("Resources/commitComment.json"),
                        .copy("Resources/pullRequest.json"),
                        .copy("Resources/pullrequestReviewComment.json")
                    ]
                   )
    ]
)
