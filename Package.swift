// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "CrowdConnectedCore",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "CrowdConnectedCore",
                 targets: ["CrowdConnectedCoreTarget"])
    ],
    dependencies: [
        .package(name: "CrowdConnectedShared",
                 url: "https://github.com/crowdconnected/crowdconnected-shared-ios.git",
                 from: "1.0.3"),
        .package(name: "AWSiOSSDKV2",
                 url: "https://github.com/aws-amplify/aws-sdk-ios-spm",
                 from: "2.24.1")
    ],
    targets: [
        .target(name: "CrowdConnectedCoreTarget",
                dependencies: [
                    .target(name: "CrowdConnectedCoreWrapper")
                ],
                path: "CrowdConnectedCoreWrap"),
        .target(name: "CrowdConnectedCoreWrapper",
                dependencies: [
                    .target(name: "CrowdConnectedCore"),
                    .product(name: "CrowdConnectedShared", package: "CrowdConnectedShared"),
                    .product(name: "AWSCognitoIdentityProvider", package: "AWSiOSSDKV2"),
                    .product(name: "AWSCognitoIdentityProviderASF", package: "AWSiOSSDKV2"),
                    .product(name: "AWSCore", package: "AWSiOSSDKV2")
                ],
                path: "CrowdConnectedCoreWrapper"),
        .binaryTarget(name: "CrowdConnectedCore",
                      path: "CrowdConnectedCore.xcframework"
        )
    ]
)
