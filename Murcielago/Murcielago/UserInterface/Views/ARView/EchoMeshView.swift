//
//  EchoMeshView.swift
//  Murcielago
//
//  Created by Sam Franusic on 5/16/25.
//

import SwiftUI

struct EchoMeshView: View {
    var body: some View {
        ZStack {
            ARViewContainer()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    EchoMeshView()
}
