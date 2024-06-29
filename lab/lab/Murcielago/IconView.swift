//
//  IconView.swift
//  lab
//
//  Created by Sam Franusic on 6/21/24.
//

import SwiftUI

struct IconView: View {
    var body: some View {
        Button {
            //
        } label: {
            murcielagoImage
                .tint(.tropicalIndigo)
        }

    }

    var murcielagoImage: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .aspectRatio(1, contentMode: .fit)
            Image("murcielago")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

#Preview {
    IconView()
        .preferredColorScheme(.dark)

}
