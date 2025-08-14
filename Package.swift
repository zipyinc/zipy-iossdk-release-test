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
    targets: [
        .binaryTarget(
            name: "ZipyiOS",
            url: "https://raw.githubusercontent.com/zipyinc/zipy-iossdk-release-test/22.0.6/ZipyiOS.xcframework.zip",
            checksum: "6834110fc6011bdb89c0ca538937c259c50e8d500db9f6c6f0a8081ad5bff7da"
        )
    ]
)
