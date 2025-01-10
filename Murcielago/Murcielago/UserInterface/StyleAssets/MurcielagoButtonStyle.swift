//
//  MurcielagoButtonStyle.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/13/24.
//

import SwiftUI

struct MurcielagoButtonStyle: ButtonStyle {
    private enum Constants {
        static let buttonOpacity: CGFloat = 1.0
        static let buttonOpacityPressed: CGFloat = 0.5
        static let cornerRadius: CGFloat = 8.0
        static let height: CGFloat = 50.0
        static let horizontalPadding: CGFloat = 50.0
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: Constants.height)
            .padding([.horizontal], Constants.horizontalPadding)
            .background(.murcielagoPrimary)
            .cornerRadius(Constants.cornerRadius)
            .foregroundColor(.surface)
            .opacity(
                configuration.isPressed
                ? Constants.buttonOpacityPressed
                : Constants.buttonOpacity
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
    .preferredColorScheme(.dark)
}
