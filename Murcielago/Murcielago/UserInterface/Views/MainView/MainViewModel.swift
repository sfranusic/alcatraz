//
//  MainViewModel.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/12/24.
//

import SwiftUI

class MainViewModel: ObservableObject {
    private let authenticator = AuthenticationService()

    @Published private(set) var unauthenticated: Bool = true
    @Published private(set) var errorMessage: String = ""
    @Published private(set) var serviceActivity = false

    @MainActor
    public func authenticate(username: String, password: String) {
        let authenticator = self.authenticator
        Task {
            serviceActivity = true
            clearErrorMessage()
            async let result = authenticator.signIn(username: username, password: password)

            if await result == false {
                displayErrorMessage(type: .invalidCredentials)
            }
            await updateAuthentication()
            serviceActivity = false
        }
    }

    @MainActor
    public func signOut() {
        Task {
            async let result = authenticator.signOut()

            if await result == false {
                assertionFailure("Sign out failed")
            }

            await updateAuthentication()
        }
    }

    @MainActor
    public func displayErrorMessage(type: SignInError) {
        errorMessage = type.localizedDescription
        UIAccessibility.post(notification: .announcement, argument: type.localizedDescription)
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
    private func updateAuthentication() async {
        unauthenticated = await !authenticator.connectionEstablished
    }

}
