//
//  SignInError.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/11/24.
//

import Foundation

enum SignInError: String, Error {
    case invalidCredentials = "Invalid credentials"
    case noCredentials = "Enter username and password"
}
