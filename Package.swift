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
        .package(url: "https://github.com/prebid/prebid-mobile-ios.git", exact: "3.1.1"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "12.9.0")
    ],
    targets: [
        .target(
            name: "_Tude",
            dependencies: [
                "Tude",
                "DTBiOSSDK",
                .product(name: "PrebidMobile", package: "prebid-mobile-ios"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ],
            path: "Tude",
            resources: [
                .copy("PrivacyInfo.xcprivacy")
            ]
        ),
        .binaryTarget(
            name: "Tude",
            path: "Tude.xcframework"
        ),
        .binaryTarget(
            name: "DTBiOSSDK",
            path: "DTBiOSSDK.xcframework"
        )
    ]
)
