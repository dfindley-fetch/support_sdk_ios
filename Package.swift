// swift-tools-version:5.9
import PackageDescription
let package = Package(
    name: "ZendeskSupportSDK",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ZendeskSupportSDK",
            targets: [
              "ZendeskSupportSDKTargets"
            ]
        )
    ],
    dependencies: [
        .package(name: "ZendeskSupportProvidersSDK",
                 url: "https://github.com/dfindley-fetch/support_providers_sdk_ios",
                 .branch("6.0.0-ios16-patch")),
        .package(name: "ZendeskMessagingSDK",
                 url: "https://github.com/dfindley-fetch/messaging_sdk_ios",
                 .branch("4.0.0-ios16-patch"))
    ],
    targets: [
        .binaryTarget(
            name: "SupportSDK",
            path: "SupportSDK.xcframework"
        ),
        .target(name: "ZendeskSupportSDKTargets",
                dependencies: [
                    .target(name: "SupportSDK"),
                    .product(name: "ZendeskSupportProvidersSDK", package: "ZendeskSupportProvidersSDK"),
                    .product(name: "ZendeskMessagingSDK", package: "ZendeskMessagingSDK")
                ],
                path: "Sources"
        )
    ]
)
