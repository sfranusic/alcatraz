//
//  ColoredSquareView.swift
//  Mesmerize
//
//  Created by Sammy Franusic on 8/11/21.
//

import SwiftUI

struct ColoredSquareView: View {

    @State private var squareColor: Color = .black

    func changeSquareColorAtRandom() {
        squareColor = .random
        let randomDelay = DispatchTimeInterval.seconds(Int.random(in: 1...3))
        DispatchQueue.main.asyncAfter(deadline: .now() + randomDelay) {
            changeSquareColorAtRandom()
        }
    }
    var body: some View {
        Rectangle()
            .foregroundColor(squareColor)
            .frame(minWidth: 10, maxWidth: 200, alignment: .center)
            .aspectRatio(1, contentMode: .fit)
            .onAppear {
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
