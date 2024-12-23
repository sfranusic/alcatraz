//
//  MurcielagoTextFieldStyle.swift
//  Murcielago
//
//  Created by Sam Franusic on 12/13/24.
//

import SwiftUI

struct MurcielagoTextFieldStyle: TextFieldStyle {
    @FocusState private var textFieldFocused: Bool
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.leading, 15)
            .frame(height: 50)
            .background {
                RoundedRectangle(cornerRadius: 8.0)
                    .fill(Color.surface)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(lineWidth: 1.0)
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
