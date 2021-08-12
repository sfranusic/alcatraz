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
    func changeSquareColorAtRandom() {
        squareColor = generateRandomColor()
        let randomDelay = DispatchTimeInterval.seconds(Int.random(in: 1...3))
        DispatchQueue.main.asyncAfter(deadline: .now() + randomDelay) {
            changeSquareColorAtRandom()
        }
    }
    var body: some View {
        Rectangle()
            .foregroundColor(squareColor)
            .frame(minWidth: 100, maxWidth: 150, alignment: .center)
            .aspectRatio(1, contentMode: .fill)
            .onAppear() {
                changeSquareColorAtRandom()
            }
            .animation(.easeIn)
    }
}

struct ColoredSquareView_Previews: PreviewProvider {
    static var previews: some View {
        ColoredSquareView()
    }
}
