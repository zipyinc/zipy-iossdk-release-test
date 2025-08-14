// swift-tools-version: 5.10

import PackageDescription

// Organization configuration
let organizationName = "zipyinc"
let repositoryName = "zipy-iossdk-release-test"

// Package configuration
let packageName = "ZipyiOS"
let zipySDKVersion = "19.0.0"

// Dependencies configuration
let swiftProtobufVersion = "1.30.0"
let swiftProtobufPackage = "https://github.com/apple/swift-protobuf.git"

// Binary target configuration
let binaryTargetName = "ZipyiOS"
let mainTargetName = "ZipyiOSMain"
let binaryURL = "https://raw.githubusercontent.com/\(organizationName)/\(repositoryName)/\(zipySDKVersion)/ZipyiOS.xcframework.zip"
let binaryChecksum = "c878fb968888f84c39ace04f51bc00569d68488a9c3c5a0adcefd858b71a5856"

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
                .target(name: "ZipyiOSCore"),
                .target(name: binaryTargetName)
            ],
            path: "Sources/\(mainTargetName)"
        ),
        .target(
            name: "ZipyiOSCore",
            dependencies: [
                .product(name: "SwiftProtobuf", package: "swift-protobuf")
            ],
            path: "ZipyiOS",
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
