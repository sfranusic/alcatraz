//
//  StopLightView.swift
//  lab
//
//  Created by Sam Franusic on 6/10/24.
//

import SwiftUI

struct StopLightView: View {
    @StateObject var model = StopLightViewModel()

    var body: some View {
        VStack {
            LightView(model: model.redLight)
            LightView(model: model.yellowLight)
            LightView(model: model.greenLight)
        }
        .background {
            Color.black
        }
        .onTapGesture {
            model.toggleLightsRunning()
        }
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(.updatesFrequently)
        .accessibilityLabel(model.currentLight)
    }
}

#Preview {
    StopLightView()
        .preferredColorScheme(.dark)
}
