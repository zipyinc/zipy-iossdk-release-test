// swift-tools-version: 5.10

import PackageDescription

// Organization configuration
let organizationName = "zipyinc"
let repositoryName = "zipy-iossdk-release-test"

// Package configuration
let packageName = "ZipyiOS"
let zipySDKVersion = "0.0.2"

// Dependencies configuration
let swiftProtobufVersion = "1.25.0"
let swiftProtobufPackage = "https://github.com/apple/swift-protobuf.git"

// Binary target configuration
let binaryTargetName = "ZipyiOS"
let mainTargetName = "ZipyiOSMain"
let binaryURL = "https://raw.githubusercontent.com/\(organizationName)/\(repositoryName)/\(zipySDKVersion)/ZipyiOS.xcframework.zip"
let binaryChecksum = "412b582648e29531eed3af6afb7c056005c99f7e0ddb77aac38efa3c6c6c321b"

let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: packageName,
            targets: [mainTargetName])
    ],
    dependencies: [
        .package(url: swiftProtobufPackage, from: Version(stringLiteral: swiftProtobufVersion)),
    ],
    targets: [
        .target(
            name: mainTargetName,
            dependencies: [
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
                .target(name: binaryTargetName)
            ],
            path: "Sources/\(mainTargetName)"
        ),
        .binaryTarget(
            name: binaryTargetName,
            url: binaryURL,
            checksum: binaryChecksum
        )
    ]
)
