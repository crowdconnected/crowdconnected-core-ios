// swift-tools-version:5.9
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
        .package(url: "https://github.com/crowdconnected/crowdconnected-shared-ios.git",
                 from: "1.7.0"),
        .package(url: "https://github.com/aws-amplify/aws-sdk-ios-spm",
                 from: "2.37.0")
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
                    .product(name: "AWSCognitoIdentityProvider", package: "aws-sdk-ios-spm"),
                    .product(name: "AWSCognitoIdentityProviderASF", package: "aws-sdk-ios-spm"),
                    .product(name: "AWSCore", package: "aws-sdk-ios-spm"),
                    .product(name: "AWSKinesis", package: "aws-sdk-ios-spm")
                ],
                path: "CrowdConnectedCoreWrapper",
                resources: [.copy("Resources/PrivacyInfo.xcprivacy")]),
        .binaryTarget(name: "CrowdConnectedCore",
                      path: "CrowdConnectedCore.xcframework"
        )
    ]
)
