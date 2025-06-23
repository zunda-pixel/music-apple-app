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
  targets: [
    .target(
      name: "MusicApp"
    ),
    .testTarget(
      name: "MusicAppTests",
      dependencies: ["MusicApp"]
    ),
  ]
)
