//
//  StopLightViewModel.swift
//  lab
//
//  Created by Sam Franusic on 6/10/24.
//

import SwiftUI

@MainActor class StopLightViewModel: ObservableObject {
    @Published var redLight = LightViewModel(.red)
    @Published var yellowLight = LightViewModel(.yellow)
    @Published var greenLight = LightViewModel(.green)

    /// Determines if stop light continue to cycle
    private(set) var shouldKeepRunning = true

    init() {
        runLights()
    }

    private func runLights() {
        turnLightsOff()
        Task.detached {
            repeat {
                await self.redLight.run()
                await self.yellowLight.run()
                await self.greenLight.run()

            } while await self.shouldKeepRunning
        }
    }

    private func turnLightsOff() {
        [redLight, yellowLight, greenLight].forEach { light in
            light.isOn = false
        }
    }

    @discardableResult func toggleLightsRunning() -> Bool {
        shouldKeepRunning.toggle()
        if shouldKeepRunning {
            runLights()
        }
        return shouldKeepRunning
    }
}

// MARK: Accessibility 
extension StopLightViewModel {
    var currentLight: String {
        let currentLight = [redLight, yellowLight, greenLight].first { $0.isOn }
        return currentLight?.accessibilityName ?? "unknown"
    }
}
