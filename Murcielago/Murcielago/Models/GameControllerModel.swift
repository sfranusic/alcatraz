//
//  GameControllerModel.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/29/24.
//

import GameController
import SwiftUI

class GameControllerModel: ObservableObject {
    @Published private(set) var connectedToController: Bool = false
    @Published private(set) var circleButtonPressed: Bool = false
    @Published private(set) var exButtonPressed: Bool = false
    @Published private(set) var leftShoulderPressed: Bool = false
    @Published private(set) var rightShoulderPressed: Bool = false
    @Published private(set) var leftThumbstickPosition: CGPoint = .zero
    @Published private(set) var rightThumbstickPosition: CGPoint = .zero
    @Published private(set) var leftTrigger: CGFloat = 0.0
    @Published private(set) var rightTrigger: CGFloat = 0.0

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
            print("Controller not found")
            return
        }

        gamepad.buttonA.pressedChangedHandler = { [weak self] (_, _, pressed) in
            self?.exButtonPressed = pressed
        }

        gamepad.buttonB.pressedChangedHandler = { [weak self] (_, _, pressed) in
            self?.circleButtonPressed = pressed
        }

        gamepad.leftThumbstick.valueChangedHandler = { [weak self] (_, xValue, yValue) in
            self?.leftThumbstickPosition = CGPoint(x: CGFloat(xValue), y: CGFloat(yValue))
        }

        gamepad.rightThumbstick.valueChangedHandler = { [weak self] (_, xValue, yValue) in
            self?.rightThumbstickPosition = CGPoint(x: CGFloat(xValue), y: CGFloat(yValue))
        }

        gamepad.leftShoulder.valueChangedHandler = { [weak self] (_, _, pressed) in
            self?.leftShoulderPressed = pressed
        }

        gamepad.rightShoulder.valueChangedHandler = { [weak self] (_, _, pressed) in
            self?.rightShoulderPressed = pressed
        }

        gamepad.leftTrigger.valueChangedHandler = { [weak self] (_, value, _) in
            self?.leftTrigger = CGFloat(value)
        }

        gamepad.rightTrigger.valueChangedHandler = { [weak self] (_, value, _) in
            self?.rightTrigger = CGFloat(value)
        }

    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
