//
//  SignInView.swift
//  EchoDemo
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
            logoView
                .foregroundStyle(.surface)
            loginUserInterface
                .tint(.murcielagoPrimary)
        }
        .onAppear {
            showLoginUserInterface = true
        }
    }

    private var logoView: some View {
        Image(systemName: "waveform")
            .resizable()
            .scaledToFit()
            .frame(width: 100)
            .aspectRatio(1, contentMode: .fit)
    }

    private var loginUserInterface: some View {
        VStack {
            statusView
            textFieldsView
            signInButton

        }
        .opacity(showLoginUserInterface ? 1.0 : 0.0)
        .animation(
            /*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/(duration: 1.0),
            value: showLoginUserInterface
        )
        .padding()
    }

    private var textFieldsView: some View {
        VStack {
            Group {
                TextField(text: $usernameInput) {
                    Text("Username")
                }
                SecureField(text: $passwordInput) {
                    Text("Password")
                }
            }
            .padding([.horizontal], 15)
            .frame(height: 50)
            .background {
                Color.surface
            }
            .overlay {
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(lineWidth: 1.0)
            }
        }
    }

    private var signInButton: some View {
        Button(
            action: {
                guard !usernameInput.isEmpty, !passwordInput.isEmpty else {
                    mainModel.displayErrorMessage(type: .noCredentials)
                    return
                }
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
                .animation(.easeIn(duration: 0.5))
        }
        .frame(height: 50)
    }
}

#Preview {
    SignInView()
        .environmentObject(MainViewModel())
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
