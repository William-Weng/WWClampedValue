[English](./README.en.md) | [繁體中文](./README.md)

# WWClampedValue

[![Swift-5.10+](https://img.shields.io/badge/Swift-5.10+-orange.svg)](https://developer.apple.com/swift/)
[![iOS-17.0+](https://img.shields.io/badge/iOS-17.0+-pink.svg?style=flat)](https://developer.apple.com/swift/)
![TAG](https://img.shields.io/github/v/tag/William-Weng/WWClampedValue)
![SwiftUI](https://img.shields.io/badge/SwiftUI-supported-green.svg)
![SPM](https://img.shields.io/badge/SPM-supported-brightgreen.svg)
[![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/)

`WWClampedValue` is a lightweight and elegant [`Swift Property Wrapper`](https://www.swiftbysundell.com/articles/property-wrappers-in-swift/) designed to clamp any [`Comparable`](https://www.youtube.com/watch?v=ahChqPknjGs) value within a specified `ClosedRange`. It is perfect for limiting UI alpha values, game scores, age inputs, and more.

![WWClampedValue](https://github.com/user-attachments/assets/e37ee4d5-0078-4a17-a330-8079b4dcb71f)

## 🚀 [Features](https://peterpanswift.github.io/iphone-bezels/)

- **Type Safe**: Built with generics, supporting all types conforming to `Comparable` (e.g., `Int`, `Double`, `Float`).
- **Elegant Syntax**: Seamlessly combines Swift Property Wrappers with `ClosedRange` syntax (e.g., `0...100`).
- **Underlying Extension**: Exposes a `.clamped(to:)` method on `Comparable`, allowing usage outside of property wrapper contexts.

## 📦 Installation (Swift Package Manager)

In Xcode, go to `File` -> `Add Packages...` and enter the repository URL:

```text
https://github.com/William-Weng/WWClampedValue
```

Alternatively, add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/William-Weng/WWClampedValue", from: "1.0.0")
]
```

## 💡 Usage Examples

### 1. As a Property Wrapper

The most common way is to apply it directly to properties within a struct or class:

```swift
import WWClampedValue

struct User {
    // Clamps the score between 0 and 100
    @WWClampedValue(0...100) var score: Int = 50
    
    // Clamps the alpha between 0.0 and 1.0
    @WWClampedValue(0.0...1.0) var alpha: Double = 0.5
}

var player = User()

// Test exceeding the maximum bound
player.score = 150
print(player.score) // Output: 100

// Test falling below the minimum bound
player.alpha = -0.5
print(player.alpha) // Output: 0.0
```

### 2. Using the Extension Method Directly

If you prefer not to bind it to a property, you can invoke `.clamped(to:)` directly on any compatible value:

```swift
import WWClampedValue

let currentTemperature = 45
let safeRange = 10...30

let optimizedTemperature = currentTemperature.clamped(to: safeRange)
print(optimizedTemperature) // Output: 30
```
