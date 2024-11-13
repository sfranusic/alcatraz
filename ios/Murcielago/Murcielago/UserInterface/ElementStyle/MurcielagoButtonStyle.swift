//
//  MurcielagoButtonStyle.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/13/24.
//

import SwiftUI

struct MurcielagoButtonStyle: ButtonStyle {
    private enum Size {
        static let height: CGFloat = 50.0
        static let horizontalPadding: CGFloat = 50.0
    }
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: Size.height)
            .padding([.horizontal], Size.horizontalPadding)
            .background(.murcielagoPrimary)
            .cornerRadius(8.0)
            .foregroundColor(.surface)
            .opacity(
                configuration.isPressed
                ? 0.5
                : 1.0
            )

    }
}

extension ButtonStyle where Self == MurcielagoButtonStyle {
    static var murcielago: Self {
        .init()
    }
}

#Preview {
    ZStack {
        Button {
            print("Preview tapped")
        } label: {
            Text("Preview")
        }
        .buttonStyle(.murcielago)
    }
}
