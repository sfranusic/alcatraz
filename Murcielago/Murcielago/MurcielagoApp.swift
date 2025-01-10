//
//  MurcielagoApp.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/11/24.
//

import SwiftUI

@main
struct MurcielagoApp: App {
    @StateObject private var mainModel = MainViewModel(authenticationService: .mock)
    @State private var showSignIn = true

    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSignIn {
                    SignInView()
                        .transition(.move(edge: .leading))
                } else {
                    MainView()
                }
            }
            .environmentObject(mainModel)
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
