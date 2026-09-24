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
        .package(url: "https://github.com/prebid/prebid-mobile-ios.git", exact: "3.3.1"),
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
            url: "https://github.com/aditudeinc/cloud-ios-binaries/releases/download/3.10.3-pinned/Tude.xcframework.zip",
            checksum: "625b898d976084b865bbce3ac5b57bf58888762418c46e2cae8080d9f13b0644"
        ),
        .binaryTarget(
            name: "DTBiOSSDK",
            url: "https://github.com/aditudeinc/cloud-ios-binaries/releases/download/3.10.3-pinned/DTBiOSSDK.xcframework.zip",
            checksum: "3145c5c28fe864a15724f981ff0369278ab962dff7ab63b3594215f8b63d1901"
        ),
    ]
)
