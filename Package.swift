// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "CrowdConnectedCore",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "CrowdConnectedCore",
                 targets: ["CrowdConnectedCoreTarget"])
    ],
    dependencies: [
        .package(url: "https://github.com/crowdconnected/crowdconnected-shared-ios.git",
                 exact: "2.3.0-beta.3")
                 ],
    targets: [
        .target(name: "CrowdConnectedCoreTarget",
                dependencies: [
                    .target(name: "CrowdConnectedCoreWrapper")
                ],
                path: "CrowdConnectedCoreWrap",
                resources: [.copy("Resources/PrivacyInfo.xcprivacy")]),
        .target(name: "CrowdConnectedCoreWrapper",
                dependencies: [
                    .target(name: "CrowdConnectedCore"),
                    .product(name: "CrowdConnectedShared", package: "crowdconnected-shared-ios")
                ],
                path: "CrowdConnectedCoreWrapper",
                resources: [.copy("Resources/PrivacyInfo.xcprivacy")]),
        .binaryTarget(name: "CrowdConnectedCore",
                      path: "CrowdConnectedCore.xcframework"
        )
    ]
)
