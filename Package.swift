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
            url: "https://github.com/zipyinc/zipy-iossdk-release-test/releases/download/0.0.4/ZipyiOS.xcframework.zip",
            checksum: "a926ffe414233219a4acf73fb40dcf0e097bb4f343365d6bce2b4eaa7ba4b2c4"
        )
    ]
)