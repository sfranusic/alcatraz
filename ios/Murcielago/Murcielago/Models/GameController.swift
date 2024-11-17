//
//  GameController.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/15/24.
//

import GameController

class ControllerModel: ObservableObject {
    @Published var connectedToController: Bool = false
    @Published var circleButtonPressed: Bool = false
    @Published var exButtonPressed: Bool = false
    @Published var leftThumbstickX: Float = 0.0
    @Published var leftThumbstickY: Float = 0.0
    @Published var rightThumbstickX: Float = 0.0
    @Published var rightThumbstickY: Float = 0.0

    var controller: GCController?

    init() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(controllerConnected),
            name: .GCControllerDidConnect,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(controllerDisconnected),
            name: .GCControllerDidDisconnect,
            object: nil
        )

        GCController.startWirelessControllerDiscovery(completionHandler: nil)
    }

    @objc private func controllerConnected(notification: Notification) {
        if let controller = notification.object as? GCController {
            self.controller = controller
            setupController(controller: controller)
            connectedToController = true
        }
    }

    @objc private func controllerDisconnected(notification: Notification) {
        if let controller = notification.object as? GCController, controller == self.controller {
            self.controller = nil
            connectedToController = false
        }
    }

    private func setupController(controller: GCController) {
        guard let gamepad = controller.extendedGamepad else {
            print("Extended gamepad not found")
            return
        }

        gamepad.buttonA.pressedChangedHandler = { [weak self] (button, value, pressed) in
            self?.exButtonPressed = pressed
        }

        gamepad.buttonB.pressedChangedHandler = { [weak self] (button, value, pressed) in
            self?.circleButtonPressed = pressed
        }

        gamepad.leftThumbstick.valueChangedHandler = { [weak self] (_, xValue, yValue) in
            self?.leftThumbstickX = xValue
            self?.leftThumbstickY = yValue
        }

        gamepad.rightThumbstick.valueChangedHandler = { [weak self] (dpad, xValue, yValue) in
            self?.rightThumbstickX = xValue
            self?.rightThumbstickY = yValue
        }
    }
}
