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
            url: "https://github.com/aditudeinc/cloud-ios-binaries/releases/download/3.10.2/Tude.xcframework.zip",
            checksum: "64f995bf21626408d4203e4f3c7ba1da68c34010a5238a977fc7455312bb62c4"
        ),
        .binaryTarget(
            name: "DTBiOSSDK",
            url: "https://github.com/aditudeinc/cloud-ios-binaries/releases/download/3.10.2/DTBiOSSDK.xcframework.zip",
            checksum: "62b1bb1344dbbb9e18604281e91589330b9a5aba240845bac92897a85c5cb859"
        ),
    ]
)
