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
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.25.0")
    ],
    targets: [
        .binaryTarget(
            name: "ZipyiOS",
            url: "https://github.com/zipyinc/zipy-iossdk-release-test/releases/download/0.0.2/ZipyiOS.xcframework.zip",
            checksum: "da215129dcb596948bad2bfdbae9f1688866391e209527eaeaf2da1bbac969d8"
        )
    ]
)