// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UnstoppableDomainsResolution",
    platforms: [.macOS(.v10_15), .iOS(.v11) ],
    products: [
        .library(
            name: "UnstoppableDomainsResolution",
            type: nil,
            targets: ["UnstoppableDomainsResolution"])
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.4.0"),
        .package(url: "https://github.com/attaswift/BigInt.git", from: "5.0.0"),
        .package(url: "https://github.com/sche/EthereumAddress.git", .branch("update-CryptoSwift-version"))
    ],
    targets: [
        .target(
            name: "UnstoppableDomainsResolution",
            dependencies: ["CryptoSwift", "BigInt", "EthereumAddress"],
            resources: [
                .process("Resources/CNS/supported-keys.json"),
                .process("Resources/CNS/cnsProxyReader.json"),
                .process("Resources/CNS/cnsRegistry.json"),
                .process("Resources/CNS/cnsResolver.json"),
                .process("Resources/CNS/network-config.json"),
                .process("Resources/ENS/ensRegistry.json"),
                .process("Resources/ENS/ensResolver.json")
            ],
            swiftSettings: [.define("INSIDE_PM")]
        ),
        .testTarget(
            name: "ResolutionTests",
            dependencies: ["UnstoppableDomainsResolution"],
            exclude: ["Info.plist"],
            swiftSettings: [.define("INSIDE_PM")]
        )
    ]
)
