// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "swift-parser",
    products: [
        .executable(name: "swift-parser", targets: ["Main"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
    ],
    targets: [
        .target(
            name: "Main",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "CodeParser"
            ],
            path: "Sources/Command"
        ),
        .target(
            name: "CodeParser",
            dependencies: [],
            path: "Sources/CodeParser"
        ),
        .testTarget(
            name: "CodeParserTests",
            dependencies: ["CodeParser"]
        ),
    ]
)
