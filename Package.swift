// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ZipyiOS",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ZipyiOS",
            type: .dynamic,
            targets: ["ZipyiOS"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.25.0")
    ],
    targets: [
        .target(
            name: "ZipyiOS",
            dependencies: [
                .product(name: "SwiftProtobuf", package: "swift-protobuf")
            ],
            path: "ZipyiOS/ZipyiOS.swift",
            exclude: ["proto/eventsData.proto"],
            sources: [".", "proto/Generated"]
        )
    ]
) 