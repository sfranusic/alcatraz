//
//  MainViewModel.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/12/24.
//

import SwiftUI

class MainViewModel: ObservableObject {
    let authenticator = AuthenticationService()
    
    @Published private(set) var isAuthenticated: Bool = true

}
