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
            url: "https://github.com/zipyinc/zipy-iossdk-release-test/releases/download/0.0.3/ZipyiOS.xcframework.zip",
            checksum: "79333bec09dbfbd90d6281d29f19079071e8660e6910412a4c7ab2068a92a83f"
        )
    ]
)