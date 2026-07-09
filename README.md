[English](./README.en.md) | [繁體中文](./README.md)

# WWClampedValue

[![Swift-5.10+](https://img.shields.io/badge/Swift-5.10+-orange.svg)](https://developer.apple.com/swift/)
[![iOS-17.0+](https://img.shields.io/badge/iOS-17.0+-pink.svg?style=flat)](https://developer.apple.com/swift/)
![TAG](https://img.shields.io/github/v/tag/William-Weng/WWClampedValue)
![SwiftUI](https://img.shields.io/badge/SwiftUI-supported-green.svg)
![SPM](https://img.shields.io/badge/SPM-supported-brightgreen.svg)
[![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/)

`WWClampedValue` 是一個輕量、優雅的[`屬性包裝器`](https://medium.com/jeremy-xue-s-blog/swift-程式語言-property-wrappers-574e25cdcd44)，專門用來將任何符合 [`Comparable`](https://www.youtube.com/watch?v=EBNZF-UbBv0) 協定的數值限制在指定的閉區間（Closed Range）範圍內。適用於限制 UI 元件透明度、遊戲分數、年齡輸入等情境。

![WWClampedValue](https://github.com/user-attachments/assets/e37ee4d5-0078-4a17-a330-8079b4dcb71f)

## 🚀 [特色](https://peterpanswift.github.io/iphone-bezels/)

- **型別安全**：基於泛型設計，支援 `Int`、`Double`、`Float` 等所有符合 `Comparable` 的型別。
- **語法優雅**：結合 Swift Property Wrapper 與 `ClosedRange` 語法（例如 `0...100`）。
- **底層擴充**：額外提供 `Comparable` 的 `.clamped(to:)` 擴充方法，非 Property Wrapper 情境也能直接使用。

## 📦 安裝方式 (Swift Package Manager)

在你的 Xcode 專案中，依序點選 `File` -> `Add Packages...`，並輸入本套件的 GitHub 網址：

```text
https://github.com/William-Weng/WWClampedValue
```

或是將以下內容加入到你的 `Package.swift` 檔案中：

```swift
dependencies: [
    .package(url: "https://github.com/William-Weng/WWClampedValue", from: "1.0.0")
]
```

## 💡 使用範例

### 1. 作為 Property Wrapper 使用

最常見的用法是直接標記在結構（Struct）或類別（Class）的屬性上：

```swift
import WWClampedValue

struct User {
    // 限制分數在 0 到 100 之間
    @WWClampedValue(0...100) var score: Int = 50
    
    // 限制透明度在 0.0 到 1.0 之間
    @WWClampedValue(0.0...1.0) var alpha: Double = 0.5
}

var player = User()

// 測試超過最大值
player.score = 150
print(player.score) // 輸出: 100

// 測試低於最小值
player.alpha = -0.5
print(player.alpha) // 輸出: 0.0
```

### 2. 直接使用擴充方法 (Extension)

如果你不想綁定在屬性上，也可以對一般數值呼叫 `.clamped(to:)`：

```swift
import WWClampedValue

let currentTemperature = 45
let safeRange = 10...30

let optimizedTemperature = currentTemperature.clamped(to: safeRange)
print(optimizedTemperature) // 輸出: 30
```
