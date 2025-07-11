// swift-tools-version: 6.2

import PackageDescription

let package = Package(
  name: "MusicApp",
  defaultLocalization: "en",
  platforms: [
    .iOS(.v26),
    .macOS(.v26),
  ],
  products: [
    .library(
      name: "MusicApp",
      targets: ["MusicApp"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.3.3")
  ],
  targets: [
    .target(
      name: "MusicApp",
      dependencies: [
        .product(name: "Kingfisher", package: "Kingfisher"),
      ]
    ),
    .testTarget(
      name: "MusicAppTests",
      dependencies: ["MusicApp"]
    ),
  ]
)
