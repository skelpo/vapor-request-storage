// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "VaporRequestStorage",
    products: [
        .library(name: "VaporRequestStorage", targets: ["VaporRequestStorage"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0-rc")
    ],
    targets: [
    .target(name: "VaporRequestStorage", dependencies: ["Vapor"], path: "Sources"),
    .testTarget(name: "VaporRequestStorageTests", dependencies: ["VaporRequestStorage"], path: "Tests"),
    ]
)
