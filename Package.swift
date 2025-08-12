// swift-tools-version: 5.10

import PackageDescription

// Organization configuration
let organizationName = "zipyinc"
let repositoryName = "zipy-iossdk-release-test"

// Package configuration
let packageName = "ZipyiOS"
let zipySDKVersion = "17.0.2"

// Dependencies configuration
let swiftProtobufVersion = "1.29.0"
let swiftProtobufPackage = "https://github.com/apple/swift-protobuf.git"

// Binary target configuration
let binaryTargetName = "ZipyiOS"
let mainTargetName = "ZipyiOSMain"
let binaryURL = "https://raw.githubusercontent.com/\(organizationName)/\(repositoryName)/\(zipySDKVersion)/ZipyiOS.xcframework.zip"
let binaryChecksum = "3f314e48d5b2a61612b4d3d8d585bf1cf02d97c8ae8f227c8b13c1fe5622b7fa"

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
