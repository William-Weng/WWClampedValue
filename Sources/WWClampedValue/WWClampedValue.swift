//
//  Extension.swift
//  Example
//
//  Created by William.Weng on 2026/7/9.
//

/// 限制數值範圍
@propertyWrapper
public struct WWClampedValue<T: Comparable> {
    
    private var value: T
    
    let range: ClosedRange<T>
    
    /// 初始化數值
    /// - Parameters:
    ///   - wrappedValue: 數值
    ///   - range: 數值有效範圍
    public init(wrappedValue: T, _ range: ClosedRange<T>) {
        self.range = range
        self.value = wrappedValue.clamped(to: range)
    }
    
    /// 數值處理
    public var wrappedValue: T {
        get { value }
        set { value = newValue.clamped(to: range) }
    }
}

// 擴充 Comparable 讓語法更優雅
private extension Comparable {
    
    /// 限制數字大小在範圍之內 (lower ~ <Value> ~ upper)
    /// - Parameter range: 數字大小在範圍
    /// - Returns: 回傳範圍值
    func clamped(to range: ClosedRange<Self>) -> Self {
        
        if self < range.lowerBound { return range.lowerBound }
        if self > range.upperBound { return range.upperBound }
        
        return self
    }
}

