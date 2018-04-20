# Vapor Request Storage

This package works as a replacement for `request.storage` which was available in Vapor 1 & 2.

## Installation

Add the package declaration to your project's manifest `dependencies` array:

```swift
.package(url: "https://github.com/skelpo/vapor-request-storage.git", from: "0.1.0")
```

Then add the `VaporRequestStorage` to the `dependencies` array of any target you want access to it in.

Complete the installation by running `vapor update` or `swift package update` from the command-line.

## Usage

In the `configure.swift` file, import `VaporRequestStorage`. Then register the provider with the `services` object passed into the `configure(_:_:_:)` function:

```swift
try service.register(StorageProvider())
```

You can now use the `Storage` service and a `privateContainer` to store data in a request.

To set a value, there is a `request.set(_:to:)` method:

```swift
try request.set("key", to: value)
```

To get the value later, use the `request.get(_:as:)` method:

```swift
try request.get("key", as: Value.self)
```

The second parameter of the `get` method has a default value of `Stored.self`, which means if you specify the return type somewhere else, you can skip passing that value in:

```swift
let value: Value = try request.get("key")
```