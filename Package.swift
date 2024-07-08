// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "swift-formatter",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
    ],
    targets: [
        .executableTarget(
            name: "swift-formatter",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "CodeFormatter"
            ],
            path: "Sources/Command"
        ),
        .target(
            name: "CodeFormatter",
            dependencies: [],
            path: "Sources/CodeFormatter"
        ),
        .testTarget(
            name: "CodeFormatterTests",
            dependencies: ["CodeFormatter"]
        ),
    ]
)
