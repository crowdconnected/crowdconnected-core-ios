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
                 exact: "1.6.7"),
        .package(url: "https://github.com/awslabs/aws-sdk-swift",
                 from: "1.2.59")
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
                    .product(name: "CrowdConnectedShared", package: "crowdconnected-shared-ios"),
                    .product(name: "AWSCognitoIdentity", package: "aws-sdk-swift"),
                    .product(name: "AWSCognitoIdentityProvider", package: "aws-sdk-swift"),
                    .product(name: "AWSClientRuntime", package: "aws-sdk-swift"),
                    .product(name: "AWSKinesis", package: "aws-sdk-swift")
                ],
                path: "CrowdConnectedCoreWrapper",
                resources: [.copy("Resources/PrivacyInfo.xcprivacy")]),
        .binaryTarget(name: "CrowdConnectedCore",
                      path: "CrowdConnectedCore.xcframework"
        )
    ]
)
