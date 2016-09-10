import PackageDescription

let package = Package(
    name: "examples",
    dependencies: [
        .Package(url: "../libs/Venice", majorVersion: 0)
    ]
)
