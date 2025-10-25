// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "swift-typed-date",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macCatalyst(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TypedDate",
            targets: ["TypedDate"]
        )
    ],
    dependencies: [
        // Depend on the Swift 6.0 release of SwiftSyntax
        .package(url: "https://github.com/apple/swift-syntax.git", from: "600.0.0"),
        .package(url: "https://github.com/apple/swift-testing.git", from: "0.1.0"),
        .package(url: "https://github.com/pointfreeco/swift-macro-testing", from: "0.2.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        // Macro implementation that performs the source transformation of a macro.
        .macro(
            name: "TypedDateMacros",
            dependencies: [
                "TypedDateCore",
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),

        // Library that exposes a macro as part of its API, which is used in client programs.
        .target(
            name: "TypedDate",
            dependencies: [
                "TypedDateCore",
                "TypedDateMacros"
            ]
        ),
        .target(
            name: "TypedDateCore",
            dependencies: [
            ]
        ),

        .testTarget(
            name: "TypedDateMacrosTests",
            dependencies: [
                "TypedDateMacros",
                "TypedDateCore",
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "MacroTesting", package: "swift-macro-testing")
            ]
        ),
        .testTarget(
            name: "TypedDateTests",
            dependencies: [
                "TypedDate",
                .product(name: "Testing", package: "swift-testing"),
            ]
        )
    ]
)
