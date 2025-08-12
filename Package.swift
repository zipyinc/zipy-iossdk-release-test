// swift-tools-version: 5.10

import PackageDescription

// Organization configuration
let organizationName = "zipyinc"
let repositoryName = "zipy-iossdk-release-test"

// Package configuration
let packageName = "ZipyiOS"
let zipySDKVersion = "17.0.6"

// Dependencies configuration
let swiftProtobufVersion = "1.30.0"
let swiftProtobufPackage = "https://github.com/apple/swift-protobuf.git"

// Binary target configuration
let binaryTargetName = "ZipyiOS"
let mainTargetName = "ZipyiOSMain"
let binaryURL = "https://raw.githubusercontent.com/\(organizationName)/\(repositoryName)/\(zipySDKVersion)/ZipyiOS.xcframework.zip"
let binaryChecksum = "17df91476f3a18f87633f770b83587ce6a18c2eafa5202064049e217fb0ee377"

let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: packageName,
            type: .static,  // Changed to static to avoid duplicate symbols
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
            path: "Sources/\(mainTargetName)",
            swiftSettings: [
                .define("SWIFT_PACKAGE")
            ]
        ),
        .binaryTarget(
            name: binaryTargetName,
            url: binaryURL,
            checksum: binaryChecksum
        )
    ]
)
