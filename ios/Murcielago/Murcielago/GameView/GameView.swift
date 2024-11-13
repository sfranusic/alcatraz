//
//  GameView.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/12/24.
//

import SwiftUI

struct GameView: View {
    @State var rotation: CGFloat = 0.0
    var body: some View {
        Image(systemName: "gamecontroller.fill")
            .resizable()
            .scaledToFit()
            .padding(50)
            .rotationEffect(.degrees(rotation))
            .animation(.linear(duration: 3.0), value: rotation)
            .onAppear {
                rotation = 360.0
            }
    }
}

#Preview {
    GameView()
}
