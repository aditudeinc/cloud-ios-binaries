// swift-tools-version:5.8
import PackageDescription
 
let package = Package(
    name: "Tude",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "Tude",
            targets: ["_Tude"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "11.2.0")
    ],
    targets: [
        .target(
            name: "_Tude",
            dependencies: [
                "Tude",
                "PrebidMobile",
                "DTBiOSSDK",
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
            name: "PrebidMobile",
            path: "PrebidMobile.xcframework"
        ),
        .binaryTarget(
            name: "DTBiOSSDK",
            path: "DTBiOSSDK.xcframework"
        )
    ]
)
