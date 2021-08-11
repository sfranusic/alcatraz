//
//  ColoredSquareView.swift
//  Mesmerize
//
//  Created by Sammy Franusic on 8/11/21.
//

import SwiftUI

struct ColoredSquareView: View {

    @State private var squareColor: Color = .black
    var randomOpacity: Double {
        Double.random(in: 0.5...1)
    }
    var randomRGBValue: Double {
        Double.random(in: 0...255)/255
    }
    func generateRandomColor() -> Color {
        Color(.sRGB, red: randomRGBValue, green: randomRGBValue, blue: randomRGBValue, opacity: randomOpacity)
    }

    var body: some View {
        Rectangle()
            .foregroundColor(squareColor)
            .frame(width: 150, height: 150, alignment: .center)
    }
}

struct ColoredSquareView_Previews: PreviewProvider {
    static var previews: some View {
        ColoredSquareView()
    }
}
