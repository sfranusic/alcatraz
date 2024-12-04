//
//  MurcielagoApp.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/11/24.
//

import SwiftUI

@main
struct MurcielagoApp: App {
    @StateObject private var mainModel = MainViewModel()
    @State private var showSignIn = true

    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSignIn {
                    SignInView()
                        .environmentObject(mainModel)
                        .transition(.move(edge: .bottom))
                } else {
                    MainView()
                }
            }
            .animation(.easeInOut(duration: 0.5), value: showSignIn)
            .onAppear {
                showSignIn = mainModel.unauthenticated
            }
            .onChange(of: mainModel.unauthenticated) { _, newValue in
                showSignIn = newValue
            }
            .preferredColorScheme(.dark)
        }
    }
}
