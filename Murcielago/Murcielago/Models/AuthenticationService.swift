//
//  AuthenticationService.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/11/24.
//

import Foundation
import SwiftUI

actor AuthenticationService {
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
