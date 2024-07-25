//
//  MockControllerView.swift
//  lab
//
//  Created by Sam Franusic on 7/23/24.
//

import SwiftUI

struct MockControllerView: View {
    private var viewModel = MockControllerViewModel()
    @EnvironmentObject var controllerModel: ControllerModel
    var body: some View {
        VStack(alignment: .leading) {
            controllerConnectionView
            Text("O Button: \(controllerModel.circleButtonPressed ? "Pressed" : "Not Pressed")")
            Text("X Button: \(controllerModel.exButtonPressed ? "Pressed" : "Not Pressed")")
            Text(leftThumbstickLabel)
            Text(rightThumbstickLabel)
        }
        .padding()
    }

    private var leftThumbstickLabel: String {
        let label = viewModel.generateTrimmedLabel(
            controllerModel.leftThumbstickX,
            controllerModel.leftThumbstickY
        )
        return "Left Thumbstick: \(label)"
    }

    private var rightThumbstickLabel: String {
        let label = viewModel.generateTrimmedLabel(
            controllerModel.rightThumbstickX,
            controllerModel.rightThumbstickY
        )
        return "Right Thumbstick: \(label)"
    }

    private var controllerConnectionView: some View {
        HStack {
            Image(systemName: "gamecontroller")
            if controllerModel.connectedToController {
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
        .environmentObject(ControllerModel())
}
