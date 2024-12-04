//
//  ControllerSettingsView.swift
//  Murcielago
//
//  Created by Sam Franusic on 12/2/24.
//

import SwiftUI

struct ControllerSettingsView: View {
    @StateObject var model = ControllerModel()
    var body: some View {
        VStack {
            VStack {
                Text("\(model.connectedToController)")
                Text("Left Trigger")
                PercentageBarView(value: model.leftTrigger)
                Text(model.circleButtonPressed ? "O" : "-")
            }

        }
        .padding([.horizontal])
        .onReceive(model.$leftTrigger) { value in
            print("Left Trigger: \(value)")
        }
    }
}

#Preview {
    ControllerSettingsView()
}
