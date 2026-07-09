//
//  ContentView.swift
//  Example
//
//  Created by William.Weng on 2026/7/9.
//

import SwiftUI
import WWClampedValue

struct ContentView: View {
    
    @WWClampedValue(0...100) var score: Int = -100
    @WWClampedValue(0.0...1.0) var alpha: Double = 2.0
    
    var body: some View {
        VStack {
            Text("score = \(score)")
                .font(.title)
            Text("alpha = \(alpha)")
                .font(.title)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
