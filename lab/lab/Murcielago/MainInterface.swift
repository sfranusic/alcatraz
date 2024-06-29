//
//  MainInterface.swift
//  lab
//
//  Created by Sam Franusic on 5/1/24.
//

import SwiftUI

struct MainInterface: View {
    @State var eyesOn: Bool = false
    var body: some View {
        ZStack {
            IconView()
        }
        .statusBar(hidden: true)
    }
}

#Preview {
    MainInterface()
}
