//
//  ControllerSettingsView.swift
//  Murcielago
//
//  Created by Sam Franusic on 12/2/24.
//

import SwiftUI

struct ControllerSettingsView: View {
    @StateObject var controller = ControllerModel()
    var body: some View {
        VStack {
            VStack {
                Text("\(controller.circleButtonPressed)")
                Text("Left Trigger")
                PercentageBarView(value: controller.leftTrigger)
            }

        }
        .padding([.horizontal])
    }
}

#Preview {
    ControllerSettingsView()
}
