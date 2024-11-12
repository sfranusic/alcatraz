//
//  SignInViewModel.swift
//  EchoDemo
//
//  Created by Sam Franusic on 11/11/24.
//

import Foundation
import SwiftUI

class SignInViewModel: ObservableObject {
    private let authenticator = AuthenticationService()
    @Published var errorMessage: String = ""
    @Published var serviceActivity = false

    func authenticate(username: String, password: String) {
        Task {
            serviceActivity = true
            clearErrorMessage()
            async let result = authenticator.signIn(username: username, password: password)

            if await result == false {
                displayErrorMessage()
            }
            serviceActivity = false
        }
    }

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

    private func clearErrorMessage() {
        errorMessage = ""
    }
}
