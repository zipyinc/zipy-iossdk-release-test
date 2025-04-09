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
            targets: ["ZipyiOSMain"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.25.0"),
    ],
    targets: [
        .target(
            name: "ZipyiOSMain",
            dependencies: [
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
                "ZipyiOS"
            ],
            path: "Sources/ZipyiOSMain"
        ),
        .binaryTarget(
            name: "ZipyiOS",
            url: "https://raw.githubusercontent.com/zipyinc/zipy-iossdk-release-test/0.0.21/ZipyiOS.xcframework.zip",
            checksum: "a5a9824c13aa37fa4b048254a0bcdda10bb742ef856023a926829f6230317651"
        )
    ]
)