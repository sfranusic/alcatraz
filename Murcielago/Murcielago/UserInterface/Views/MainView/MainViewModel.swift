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

    @MainActor func authenticateWithTimeout(
        username: String,
        password: String,
        seconds: TimeInterval
    ) async -> Bool {

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
                    try await Task.sleep(for: .seconds(seconds))
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

                return result
            }
        } catch {
            serviceActivity = false
            triggerErrorMessage(type: .serviceTimeout)
            return false
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
