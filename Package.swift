// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "Tude",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "Tude",
            targets: ["_Tude"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", from: "13.4.0"),
        .package(url: "https://github.com/prebid/prebid-mobile-ios.git", from: "3.3.1"),
    ],
    targets: [
        .target(
            name: "_Tude",
            dependencies: [
                "Tude",
                .product(name: "PrebidMobile", package: "prebid-mobile-ios"),
                "DTBiOSSDK",
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
            ],
            path: "Tude",
            resources: [
                .copy("PrivacyInfo.xcprivacy"),
            ]
        ),
        .binaryTarget(
            name: "Tude",
            url: "https://github.com/aditudeinc/cloud-ios-binaries/releases/download/3.10.3/Tude.xcframework.zip",
            checksum: "738188ba5031231af3d14622d3b1e8ff75cb10c92f6d5a182dc9ba589ed7382f"
        ),
        .binaryTarget(
            name: "DTBiOSSDK",
            url: "https://github.com/aditudeinc/cloud-ios-binaries/releases/download/3.10.3/DTBiOSSDK.xcframework.zip",
            checksum: "723c754762775a06dba79f6968a81241cc40496c990ccb762c6a4c40fc5ba25d"
        ),
    ]
)
