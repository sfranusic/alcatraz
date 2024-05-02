//
//  ContentView.swift
//  Lab
//
//  Created by Sam Franusic on 2/8/24.
//

import SwiftUI

struct ContentView: View {
    let color1: Color
    let color2: Color
    let size = CGFloat(50)
    var body: some View {
        ZStack {
            Circle()
                .frame(width: size)
                .foregroundColor(color1)
                .offset(x: size/4)
                .opacity(0.8)
            Circle()
                .frame(width: size)
                .foregroundColor(color2)
                .offset(x: -(size/4))
                .opacity(0.5)
        }
        .blendMode(.multiply)
        .padding()
    }
}

#Preview {
    VStack {
        ContentView(color1: .yellow, color2: .blue)
        ContentView(color1: .red, color2: .blue)
        ContentView(color1: .yellow, color2: .red)
    }
}
