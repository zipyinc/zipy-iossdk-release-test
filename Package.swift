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
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
                "ZipyiOSBinary"
            ]
        ),
        .binaryTarget(
            name: "ZipyiOSBinary",
            url: "https://raw.githubusercontent.com/zipyinc/zipy-iossdk-release-test/0.0.16/ZipyiOS.xcframework.zip",
            checksum: "a5a9824c13aa37fa4b048254a0bcdda10bb742ef856023a926829f6230317651"
        )
    ]
)