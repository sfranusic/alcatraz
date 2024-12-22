//
//  AuthenticationService.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/11/24.
//

import Foundation
import SwiftUI

protocol AuthenticationService: Sendable {
    func signIn(username: String, password: String) async -> Bool
    func signOut() async -> Bool
    var unauthenticated: Bool { get async }
    var authenticated: Bool { get async }
}

extension AuthenticationService where Self == MockAuthenticationService {
    static var mock: Self {
        .init()
    }
}

actor MockAuthenticationService: AuthenticationService, Sendable {
    private(set) var authenticated: Bool = false
    var unauthenticated: Bool {
        authenticated == false
    }

    func signIn(username: String, password: String) async -> Bool {
        do {
            try await Task.sleep(for: .seconds(Int.random(in: 0...3)))
        } catch {
            return false
        }
        authenticated = password == "password124"
        return authenticated
    }

    func signOut() async -> Bool {
        authenticated = false
        return unauthenticated
    }
}
