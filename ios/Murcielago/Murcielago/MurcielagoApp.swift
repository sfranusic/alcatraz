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
    @State var showSignIn = true

    var body: some Scene {
        WindowGroup {
            MainView()
                .fullScreenCover(isPresented: $showSignIn) {
                    SignInView()
                        .environmentObject(mainModel)
                }
                .onReceive(mainModel.$unauthenticated) { _ in
                    showSignIn = mainModel.unauthenticated
                }
                .preferredColorScheme(.dark)
        }
    }
}
