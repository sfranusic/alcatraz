//
//  AuthenticationService.swift
//  EchoDemo
//
//  Created by Sam Franusic on 11/11/24.
//

import Foundation
import SwiftUI

actor AuthenticationService {
    func signIn(username: String, password: String) async -> Bool {
        do {
            try await Task.sleep(nanoseconds: UInt64.random(in: 0...3) * 1_000_000_000)
        } catch {
            assertionFailure("Service failed due to timeout")
            return false
        }
        return password == "password124"
    }
}


