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

    var body: some Scene {
        WindowGroup {
            MainView()
                .fullScreenCover(isPresented: $mainModel.unauthenticated) {
                    SignInView()
                        .environmentObject(mainModel)
                }
                .preferredColorScheme(.dark)
        }
    }
}
