//
//  RevealSquare.swift
//  Mesmerize
//
//  Created by Sammy Franusic on 9/1/21.
//

import SwiftUI

struct RevealSquare: View {

    @State private var squareColor: Color = .black
    @State private var onlyBlueAndPink: Bool = false
    @State private var revealColor: Bool = false
    var randomBlueOrPink: Color {
        let colorSet = [Color.randomBlue, Color.randomPink]
        return revealColor ? Color.randomPink : colorSet.randomElement() ?? .white
    }
    var randomColor: Color {
        onlyBlueAndPink ? randomBlueOrPink : Color.random
    }

    func changeSquareColorAtRandom() {
        squareColor = randomColor
        let randomDelay = DispatchTimeInterval.seconds(Int.random(in: 1...3))
        DispatchQueue.main.asyncAfter(deadline: .now() + randomDelay) {
            changeSquareColorAtRandom()
        }
    }

    func colorSetChanger() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            onlyBlueAndPink = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            revealColor = true
        }
    }
    var body: some View {
        Rectangle()
            .foregroundColor(squareColor)
            .frame(minWidth: 10, maxWidth: 200, alignment: .center)
            .aspectRatio(1, contentMode: .fit)
            .onAppear {
                changeSquareColorAtRandom()
                colorSetChanger()
            }
            .animation(.easeIn)
    }
}

struct RevealSquare_Previews: PreviewProvider {
    static var previews: some View {
        RevealSquare()
    }
}
