//
//  SignInView.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/11/24.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var mainModel: MainViewModel
    @State var usernameInput: String = ""
    @State var passwordInput: String = ""
    @State var showLoginUserInterface = false

    var body: some View {
        VStack {
            murcielagoLogo
            loginUserInterface
        }
        .onAppear {
            showLoginUserInterface = true
        }
    }

    private var murcielagoLogo: some View {
        Image(systemName: "waveform")
            .resizable()
            .scaledToFit()
            .frame(width: 100)
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.surface)
            .accessibilityLabel("Murcielago")
    }

    private var loginUserInterface: some View {
        VStack {
            statusView
            textFieldsView
            signInButton
        }
        .opacity(showLoginUserInterface ? 1.0 : 0.0)
        .animation(
            .easeIn(duration: 1.0),
            value: showLoginUserInterface
        )
        .padding()
        .tint(.murcielagoPrimary)
    }

    private var textFieldsView: some View {
        VStack {
            Group {
                TextField("Username", text: $usernameInput)
                SecureField("Password", text: $passwordInput)
            }
            .textFieldStyle(.murcielago)
        }
    }

    private var signInButton: some View {
        Button(
            action: {
                mainModel.authenticate(
                    username: usernameInput,
                    password: passwordInput
                )
            },
            label: {
                Text("Sign In")
            }
        )
        .opacity(mainModel.serviceActivity ? 0.75 : 1.0)
        .buttonStyle(.murcielago)
        .disabled(mainModel.serviceActivity)
    }

    private var statusView: some View {
        ZStack {
            if mainModel.serviceActivity {
                ProgressView()
            }
            Text(mainModel.errorMessage)
                .animation(.easeInOut(duration: 0.5))
                .accessibilityHidden(true)
        }
        .frame(height: 50)
    }
}

#Preview {
    SignInView()
        .environmentObject(MainViewModel())
        .preferredColorScheme(.dark)
}
