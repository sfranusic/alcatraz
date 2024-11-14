//
//  GameView.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/12/24.
//

import SwiftUI

struct GameView: View {
    @State var rotation: CGFloat = 0.0
    @State var width: CGFloat = 0.0
    var body: some View {
        ZStack {
            controllerView
            startGameView
        }
    }

    private var controllerView: some View {
        Image(systemName: "gamecontroller.fill")
            .resizable()
            .scaledToFit()
            .padding(50)
            .rotationEffect(.degrees(rotation))
            .animation(.linear(duration: 1.5), value: rotation)
            .animation(.linear(duration: 3.0), value: width)
            .frame(width: width)
            .onAppear {
                rotation = 0.0
                width = 0.0
            }
    }

    private var startGameView: some View {
        VStack {
            Spacer()
            Button {
                print("Play button tapped")
                rotation = 360.0
                width = .infinity
            } label: {
                Text("Play")
            }
            .buttonStyle(.murcielago)
        }
        .padding()
    }
}

#Preview {
    GameView()
}
