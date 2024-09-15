//
//  MainListView.swift
//  lab
//
//  Created by Sam Franusic on 6/13/24.
//

import SwiftUI

struct MainListView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Stop Light") {
                    StopLightView()
                }
            }
        }
    }
}

#Preview {
    MainListView()
        .preferredColorScheme(.dark)
}
