//
//  BatteryIndicatorView.swift
//  Murcielago
//
//  Created by Sam Franusic on 12/3/24.
//

import SwiftUI

struct BatteryIndicatorView: View {
    let value: Float
    var batteryHeight: CGFloat = 20.0
    var batteryWidth: CGFloat {
        (batteryHeight * 2) - 10
    }

    var body: some View {
        ZStack {
            HStack {
                RoundedRectangle(cornerRadius: 5.0)
//                    .foregroundStyle(Color.green)
                    .frame(width: batteryWidth * CGFloat(value))
                Spacer(minLength: 10)
            }
            .frame(width: batteryHeight * 2)
            Image(systemName: "battery.0percent")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(height: batteryHeight)
    }
}

#Preview {
    VStack {
        ForEach(0...10, id: \.self) { value in
            BatteryIndicatorView(value: Float(value) * 0.1)
        }
    }
    .preferredColorScheme(.dark)
}
