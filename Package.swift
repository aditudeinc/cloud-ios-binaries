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
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", from: "13.2.0"),
        .package(url: "https://github.com/prebid/prebid-mobile-ios.git", from: "3.1.1"),
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
            url: "https://github.com/aditudeinc/cloud-ios-binaries/releases/download/3.8.0-alpha/Tude.xcframework.zip",
            checksum: "41354d197c68aa2d8176c065639203238cdd37291a94a397c7b5cadfcdeb6ba3"
        ),
        .binaryTarget(
            name: "DTBiOSSDK",
            url: "https://github.com/aditudeinc/cloud-ios-binaries/releases/download/3.8.0-alpha/DTBiOSSDK.xcframework.zip",
            checksum: "95ac6e16095df2117ad1cfb691aa0c23aeb35d21dbbe28ffb63d74c23da1b8be"
        ),
    ]
)
