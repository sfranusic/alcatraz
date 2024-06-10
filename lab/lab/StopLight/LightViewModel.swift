//
//  LightViewModel.swift
//  lab
//
//  Created by Sam Franusic on 6/10/24.
//

import SwiftUI

class LightViewModel: ObservableObject, @unchecked Sendable {

    enum LightType {
        case red, yellow, green
    }

    let type: LightType
    @Published var isOn = false

    init(_ type: LightType) {
        self.type = type
    }

    @MainActor func run() async {
        isOn = true
        try? await Task.sleep(nanoseconds: time)
        isOn = false
    }

    private var time: UInt64 {
        let timeMultiplier: UInt64 = 1_000_000_000
        switch type {
        case .red:
            return 3 * timeMultiplier
        case .yellow:
            return 2 * timeMultiplier
        case .green:
            return 5 * timeMultiplier
        }
    }

    var lightColor: Color {
        switch type {
        case .red:
            return .stopLightRed
        case .yellow:
            return .stopLightYellow
        case .green:
            return .stopLightGreen
        }
    }
}

// MARK: Accessibility
extension LightViewModel {
    var accessibilityName: String {
        switch type {
        case .red:
            return "rojo"
        case .yellow:
            return "amarillo"
        case .green:
            return "verde"
        }
    }
}
