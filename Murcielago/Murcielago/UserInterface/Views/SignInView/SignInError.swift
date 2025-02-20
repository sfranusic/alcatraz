//
//  SignInError.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/11/24.
//

import Foundation

enum SignInError: LocalizedError, Sendable {
    case invalidCredentials, noCredentials, serviceTimeout

    var localizedDescription: String {
        switch self {
        case .invalidCredentials:
            return String(localized: "Invalid credentials", table: "LocalizedSignInError")

        case .noCredentials:
            return String(localized: "Enter username and password", table: "LocalizedSignInError")

        case .serviceTimeout:
            return String(localized: "Service timeout", table: "LocalizedSignInError")
        }

    }
}
