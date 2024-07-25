//
//  MockControllerView.swift
//  lab
//
//  Created by Sam Franusic on 7/23/24.
//

import SwiftUI

struct MockControllerView: View {
    @StateObject private var viewModel = ControllerModel()
    var body: some View {
        VStack(alignment: .leading) {
            controllerConnectionView
            Text("O Button: \(viewModel.circleButtonPressed ? "Pressed" : "Not Pressed")")
            Text("X Button: \(viewModel.exButtonPressed ? "Pressed" : "Not Pressed")")
            Text("Left Thumbstick: (\(viewModel.leftThumbstickX), \(viewModel.leftThumbstickY))")
            Text("Right Thumbstick: (\(viewModel.rightThumbstickX), \(viewModel.rightThumbstickY))")
        }
        .padding()
    }

    private var controllerConnectionView: some View {
        HStack {
            Image(systemName: "gamecontroller")
            if viewModel.connectedToController {
                Image(systemName: "checkmark")
                    .foregroundColor(.green)
            } else {
                Image(systemName: "exclamationmark.triangle")
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    MockControllerView()
}
