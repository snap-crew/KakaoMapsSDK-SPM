// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KakaoMapsSDK-SPM",
    platforms: [.iOS(.v13), .macCatalyst(.v13)],
    
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "KakaoMapsSDK-SPM",
            targets: ["KakaoMapsSDKSPM"]),
        .library(
            name: "KakaoMapsSDK-SPM-Dynamic",
            type: .dynamic,
            targets: ["KakaoMapsSDKSPM"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        // 타깃 이름이 곧 Swift 모듈명이라 하이픈을 쓸 수 없다. Swift 6.2 부터
        // 컴파일러가 `-module-name KakaoMapsSDK-SPM` 을 거부한다.
        // 소스 위치는 그대로 두고 이름만 바꾼다. 제품 이름은 upstream 과 같게 남겨
        // 의존하는 쪽에서 고칠 게 없도록 한다.
        .target(
            name: "KakaoMapsSDKSPM",
            dependencies: ["framework"],
            path: "Sources/KakaoMapsSDK-SPM",
            resources: [.copy("KakaoMapsSDKBundle.bundle/assets")]),
        .binaryTarget(name: "framework", path: "BinaryFramework/KakaoMapsSDK.xcframework")
    ],
    swiftLanguageVersions: [.v5]
)
