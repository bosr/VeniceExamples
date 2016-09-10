import PackageDescription

let package = Package(
    name: "examples",
	dependencies: [
		.Package(url: "https://github.com/bosr/Venice.git", majorVersion: 0, minor: 12)
	]
)
