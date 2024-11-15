//
//  MainViewModel.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/12/24.
//

import SwiftUI

class MainViewModel: ObservableObject {
    let authenticator = AuthenticationService()

    @Published var unauthenticated: Bool = true
    @Published var errorMessage: String = ""
    @Published var serviceActivity = false

    func authenticate(username: String, password: String) {
        Task {
            serviceActivity = true
            await clearErrorMessage()
            async let result = authenticator.signIn(username: username, password: password)

            if await result == false {
                await displayErrorMessage()
            }
            await updateAuthentication()
            serviceActivity = false
        }
    }

    @MainActor
    private func displayErrorMessage() {
        errorMessage = SignInError.invalidCredentials.rawValue
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
            guard let self else {
                assertionFailure("Failed to clear error message.")
                return
            }
            self.clearErrorMessage()
        }
    }

    @MainActor
    private func clearErrorMessage() {
        errorMessage = ""

    }

    @MainActor
    func updateAuthentication() {
        Task { @MainActor in
            unauthenticated = await !authenticator.connectionEstablished
        }
    }

}
