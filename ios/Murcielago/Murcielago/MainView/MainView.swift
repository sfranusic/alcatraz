//
//  MainView.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/12/24.
//

import SwiftUI

struct MainView: View {
    let viewModel = MainViewModel()
    var body: some View {
        if viewModel.isAuthenticated {
            mainView
        } else {
            SignInView()
        }
    }

    private var mainView: some View {
        TabView {
            GameView()
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                }
        }
        .tint(.white)
    }
}

#Preview {
    MainView()
        .preferredColorScheme(.dark)
}
