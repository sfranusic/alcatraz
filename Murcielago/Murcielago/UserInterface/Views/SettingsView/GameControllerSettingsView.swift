//
//  ControllerSettingsView.swift
//  Murcielago
//
//  Created by Sam Franusic on 12/2/24.
//

import SwiftUI

struct GameControllerSettingsView: View {
    @StateObject var model = GameControllerModel()
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Connection Status:")
                ConnectionStatusView(connected: model.connectedToController)
                Spacer()
                if let battery = model.controller?.battery {
                    BatteryIndicatorView(value: battery.batteryLevel)
                }
            }
            Text("Left Trigger")
            PercentageBarView(value: model.leftTrigger)
            Text("Right Trigger")
            PercentageBarView(value: model.rightTrigger)
        }
        .padding([.horizontal])
    }
}

struct ConnectionStatusView: View {
    let connected: Bool
    private var connectionImage: String {
        connected
        ? "checkmark.circle"
        : "exclamationmark.circle"
    }

    var body: some View {
        Image(systemName: connectionImage)
    }
}

#Preview {
    GameControllerSettingsView()
}
