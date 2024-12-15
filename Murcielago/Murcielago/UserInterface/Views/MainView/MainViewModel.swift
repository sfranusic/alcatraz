//
//  MainViewModel.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/12/24.
//

import SwiftUI

class MainViewModel: ObservableObject {
    private let authenticationService = AuthenticationService()

    @Published private(set) var unauthenticated: Bool = true
    @Published private(set) var errorMessage: String = ""
    @Published private(set) var serviceActivity = false

    @MainActor
    public func authenticate(username: String, password: String) {
        let authenticator = self.authenticationService
        Task {
            guard !username.isEmpty, !password.isEmpty else {
                triggerErrorMessage(type: .noCredentials)
                return
            }
            clearErrorMessage()
            serviceActivity = true
            async let result = authenticator.signIn(username: username, password: password)

            if await result == false {
                triggerErrorMessage(type: .invalidCredentials)
            }
            await updateAuthentication()
            serviceActivity = false
        }
    }

    @MainActor
    public func signOut() {
        Task {
            async let result = authenticationService.signOut()

            if await result == false {
                assertionFailure("Sign out failed")
            }

            await updateAuthentication()
        }
    }

    @MainActor
    private func triggerErrorMessage(type: SignInError) {
        errorMessage = type.localizedDescription
        announceErrorMessage()
        Task {
            try? await Task.sleep(for: .seconds(2.5))
            self.clearErrorMessage()
        }
    }

    /// This method uses `UIAccessibility` to announce the error message.
    private func announceErrorMessage() {
        let message = errorMessage
        Task {
            try? await Task.sleep(for: .seconds(0.1))
            await UIAccessibility.post(notification: .announcement, argument: message)
        }
    }

    @MainActor
    private func clearErrorMessage() {
        errorMessage = ""

    }

    @MainActor
    private func updateAuthentication() async {
        unauthenticated = await !authenticationService.authenticated
    }

}
