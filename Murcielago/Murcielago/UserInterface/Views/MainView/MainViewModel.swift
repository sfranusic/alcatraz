//
//  MainViewModel.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/12/24.
//

import SwiftUI

@MainActor
final class MainViewModel: ObservableObject {
    private let authenticationService: AuthenticationService

    @Published private(set) var unauthenticated: Bool = true
    @Published private(set) var errorMessage: String = ""
    @Published private(set) var serviceActivity = false
    @Published var usernameInput: String = ""
    @Published var passwordInput: String = ""

    init(authenticationService: AuthenticationService) {
        self.authenticationService = authenticationService
    }

    func signIn(timeout: TimeInterval = 2.0) async -> Bool {
        let username = usernameInput.trimmingCharacters(in: .whitespaces)
        let password = passwordInput.trimmingCharacters(in: .whitespaces)

        guard !username.isEmpty, !password.isEmpty else {
            triggerErrorMessage(type: .noCredentials)
            return false
        }

        let authenticator = authenticationService

        do {
            return try await withThrowingTaskGroup(of: Bool.self) { group in

                serviceActivity = true

                group.addTask {
                    return await authenticator.signIn(username: username, password: password)
                }

                group.addTask {
                    try await Task.sleep(for: .seconds(timeout))
                    throw CancellationError()
                }

                let result = try await group.next()

                // Cancel group and any remaining tasks.
                group.cancelAll()
                serviceActivity = false

                guard let result, result == true else {
                    triggerErrorMessage(type: .invalidCredentials)
                    return false
                }

                await updateAuthentication()
                clearTextFields()

                return result
            }
        } catch {
            serviceActivity = false
            triggerErrorMessage(type: .serviceTimeout)
            return false
        }
    }

    public func signOut() async {
        _ = await authenticationService.signOut()
        await updateAuthentication()
    }

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
            UIAccessibility.post(notification: .announcement, argument: message)
        }
    }

    private func clearErrorMessage() {
        errorMessage = ""

    }

    private func clearTextFields() {
        usernameInput = ""
        passwordInput = ""
    }

    private func updateAuthentication() async {
        unauthenticated = await authenticationService.unauthenticated
    }

}
