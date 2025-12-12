// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "nudge-macos",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        // Add dependencies here
    ],
    targets: [
        .executableTarget(
            name: "nudge",
            dependencies: [],
            path: "Sources"
        ))
