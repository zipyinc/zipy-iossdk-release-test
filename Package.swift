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
            url: "https://github.com/zipyinc/zipy-ios-binary/releases/download/0.0.1/ZipyiOS.xcframework.zip",
            checksum: "7582cbf241687e0fc968d980afc198dcf42e97894a4a98c32f277f7609e8aa30"
        )
    ]
)