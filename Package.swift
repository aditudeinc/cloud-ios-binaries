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
        .package(url: "https://github.com/prebid/prebid-mobile-ios.git", exact: "3.3.4"),
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
            url: "https://github.com/aditudeinc/cloud-ios-binaries/releases/download/3.10.5/Tude.xcframework.zip",
            checksum: "58d6cd89df1c588f11f011f332f50a0dd991b010b167aeb31deffb1120a0a826"
        ),
        .binaryTarget(
            name: "DTBiOSSDK",
            url: "https://github.com/aditudeinc/cloud-ios-binaries/releases/download/3.10.5/DTBiOSSDK.xcframework.zip",
            checksum: "28a2bf87640510066739d188761a833d46a47cda9140ef3bcd7f2a64174781e1"
        ),
    ]
)
