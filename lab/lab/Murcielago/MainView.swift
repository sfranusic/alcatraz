//
//  MainView.swift
//  lab
//
//  Created by Sam Franusic on 5/1/24.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    var body: some View {
        ZStack {
            CameraView()
            MainInterface()
                .opacity(viewModel.coverVisible)
        }
        .onAppear {
            viewModel.animateInterface()
        }
        .onTapGesture {

        }
        .onReceive(viewModel.$networkError) { _ in
            viewModel.animateInterface()
        }
    }
}

#Preview {
    MainView()
        .preferredColorScheme(.dark)
}
