//
//  SignInView.swift
//  EchoDemo
//
//  Created by Sam Franusic on 11/11/24.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var model: MainViewModel
    @State var usernameInput: String = ""
    @State var passwordInput: String = ""
    @State var showLoginUserInterface = false

    var body: some View {
        VStack {
            logoView
            loginUserInterface
                .tint(.murcielagoPrimary)
        }
        .onAppear {
            showLoginUserInterface = true
        }
    }

    private var logoView: some View {
        Image(systemName: "globe")
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
                    model.displayErrorMessage(type: .noCredentials)
                    return
                }
                model.authenticate(
                    username: usernameInput,
                    password: passwordInput
                )
            },
            label: {
                Text("Sign In")
            }
        )
        .opacity(model.serviceActivity ? 0.75 : 1.0)
        .buttonStyle(.murcielago)
        .disabled(model.serviceActivity)
    }

    private var statusView: some View {
        ZStack {
            if model.serviceActivity {
                ProgressView()
            }
            Text(model.errorMessage)
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
