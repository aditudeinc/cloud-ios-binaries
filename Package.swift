// swift-tools-version: 5.9
import PackageDescription

let version = "0.0.1"
let baseURL = "https://github.com/aditudeinc/cloud-ios-binaries/releases/download/\(version)"

let package = Package(
  name: "Aditude",
  platforms: [
    .iOS(.v13)
  ],
  products: [
    .library(name: "AditudeCore", targets: ["AditudeCore"]),
    .library(name: "AditudePrebid", targets: ["AditudePrebid"]),
    .library(name: "AditudeGMA", targets: ["AditudeGMA"]),
  ],
  dependencies: [
    .package(
      url: "https://github.com/prebid/prebid-mobile-ios.git",
      from: "3.3.0"
    ),
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.2.0"
    ),
  ],
  targets: [

    // MARK: - AditudeCore

    .binaryTarget(
      name: "AditudeCore",
      url: "\(baseURL)/AditudeCore.xcframework.zip",
      checksum: "ddc037cf8c16f061faaeca5789da4fd3fd8222d002aa75e7d7dc3c9f122016b1"
    ),

    // MARK: - Aditude + PrebidMobile

    .binaryTarget(
      name: "AditudePrebidBinary",
      url: "\(baseURL)/AditudePrebid.xcframework.zip",
      checksum: "ea95f67fba6d9f7374a209c974b1b1f4700eed396e7dc30d2aa7f9a0d8d436a5"
    ),
    .target(
      name: "AditudePrebid",
      dependencies: [
        "AditudeCore",
        "AditudePrebidBinary",
        .product(name: "PrebidMobile", package: "prebid-mobile-ios"),
      ],
      path: "Sources/AditudePrebid"
    ),

    // MARK: - Aditude + GoogleMobileAds

    .binaryTarget(
      name: "AditudeGMABinary",
      url: "\(baseURL)/AditudeGMA.xcframework.zip",
      checksum: "bb2f17ac7a2492e7e031074c20f0da8fe1dd10859ddeea3e7096ca23d65882e1"
    ),
    .target(
      name: "AditudeGMA",
      dependencies: [
        "AditudeCore",
        "AditudeGMABinary",
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "Sources/AditudeGMA"
    ),
  ]
)
