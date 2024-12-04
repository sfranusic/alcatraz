//
//  MainView.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/12/24.
//

import SwiftUI

struct MainView: View {

    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "TabBar")
    }

    let viewModel = MainViewModel()
    var body: some View {
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
        .tint(.primary)
    }
}

#Preview {
    MainView()
        .preferredColorScheme(.dark)
}
