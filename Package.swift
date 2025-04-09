// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "ZipyiOS",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ZipyiOS",
            targets: ["ZipyiOS"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.25.0"),
    ],
    targets: [
        .target(
            name: "ZipyiOS",
            dependencies: [
                .product(name: "SwiftProtobuf", package: "swift-protobuf")
            ],
            path: "Sources/ZipyiOS"
        )
    ]
)