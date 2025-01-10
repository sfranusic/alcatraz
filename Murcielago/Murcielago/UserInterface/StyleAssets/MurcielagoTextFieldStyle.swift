//
//  MurcielagoTextFieldStyle.swift
//  Murcielago
//
//  Created by Sam Franusic on 12/13/24.
//

import SwiftUI

struct MurcielagoTextFieldStyle: TextFieldStyle {
    private enum Constants {
        static let cornerRadius: CGFloat = 8.0
        static let height: CGFloat = 50
        static let overlayWidth: CGFloat = 1.0
        static let labelPadding: CGFloat = 15
    }

    @FocusState private var textFieldFocused: Bool

    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.leading, Constants.labelPadding)
            .frame(height: Constants.height)
            .background {
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .fill(Color.surface)
            }
            .overlay {
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .stroke(lineWidth: Constants.overlayWidth)
            }
            .focused($textFieldFocused)
            .onTapGesture {
                textFieldFocused = true
            }
            .accessibilityElement(children: .combine)
    }
}

extension TextFieldStyle where Self == MurcielagoTextFieldStyle {
    static var murcielago: Self {
        .init()
    }
}

#Preview {
    @Previewable @State var passwordInput: String = ""
    @Previewable @State var usernameInput: String = ""
    VStack {
        TextField("Username", text: $usernameInput)
            .textFieldStyle(.murcielago)
        SecureField("Password", text: $passwordInput)
            .textFieldStyle(.murcielago)
    }
    .preferredColorScheme(.dark)
}
