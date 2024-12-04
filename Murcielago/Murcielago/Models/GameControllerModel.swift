//
//  ControllerModel.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/29/24.
//

import GameController
import SwiftUI

class GameControllerModel: ObservableObject {
    @Published var connectedToController: Bool = false
    @Published var circleButtonPressed: Bool = false
    @Published var exButtonPressed: Bool = false
    @Published var rightPosition: CGPoint = .zero
    @Published var leftPosition: CGPoint = .zero
    @Published var leftTrigger: CGFloat = 0.0

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

        establishConnection()
    }

    func establishConnection() {
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

        gamepad.buttonA.pressedChangedHandler = { [weak self] (button, value, pressed) in
            self?.exButtonPressed = pressed
        }

        gamepad.buttonB.pressedChangedHandler = { [weak self] (button, value, pressed) in
            self?.circleButtonPressed = pressed
        }

        gamepad.leftThumbstick.valueChangedHandler = { [weak self] (_, xValue, yValue) in
            self?.leftPosition = CGPoint(x: CGFloat(xValue), y: CGFloat(yValue))
        }

        gamepad.rightThumbstick.valueChangedHandler = { [weak self] (dpad, xValue, yValue) in
            self?.rightPosition = CGPoint(x: CGFloat(xValue), y: CGFloat(yValue))
        }

        gamepad.leftTrigger.valueChangedHandler = { [weak self] (_, value, _) in
            print("left trigger \(value)")
            self?.leftTrigger = CGFloat(value)
        }

    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
