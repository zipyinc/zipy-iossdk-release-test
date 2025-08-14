// swift-tools-version: 5.10

import PackageDescription

// Organization configuration
let organizationName = "zipyinc"
let repositoryName = "zipy-iossdk-release-test"

// Package configuration
let packageName = "ZipyiOS"
let zipySDKVersion = "21.0.8"

// Dependencies configuration
let swiftProtobufVersion = "1.30.0"
let swiftProtobufPackage = "https://github.com/apple/swift-protobuf.git"

// Binary target configuration
let binaryTargetName = "ZipyiOS"
let mainTargetName = "ZipyiOSMain"
let binaryURL = "https://raw.githubusercontent.com/\(organizationName)/\(repositoryName)/\(zipySDKVersion)/ZipyiOS.xcframework.zip"
let binaryChecksum = "83ee8afca6f642c8768badd1a53abe31fd76b15f0ab2827a4d9728a57686543c"

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
                .target(name: binaryTargetName),
                .product(name: "SwiftProtobuf", package: "swift-protobuf")

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
