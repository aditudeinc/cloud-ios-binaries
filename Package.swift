// swift-tools-version:6.0
import PackageDescription
 
let package = Package(
    name: "Tude",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Tude",
            targets: ["_Tude"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "13.2.0"),
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
            path: "Tude.xcframework"
        ),
        .binaryTarget(
            name: "DTBiOSSDK",
            path: "DTBiOSSDK.xcframework"
        ),
    ]
)
