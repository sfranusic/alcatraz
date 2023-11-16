//  Created by Sam Franusic on 9/26/23.

import SwiftUI

struct LabButtonStyle: ButtonStyle {
    let color: Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 18))
            .padding([.horizontal], 30)
            .padding([.vertical], 12)
            .foregroundColor(.buttonTextColor)
            .cornerRadius(8)
            .background {
                color
            }
            .opacity(configuration.isPressed
                ? 0.5
                : 1.0)
//            .transition(.slide.animation(.easeIn))
    }
}
extension ButtonStyle where Self == LabButtonStyle {
    static var lab: Self {
        .init(color: Color.labTriadicSet.randomElement()!)
    }
    static var labRed: Self {
        .init(color: .labRed)
    }
    static var labGreen: Self {
        .init(color: .labGreen)
    }
    static var labBlue: Self {
        .init(color: .labBlue)
    }
}

struct LabButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button("DARK") {
                print("Dark tap")
            }
            .preferredColorScheme(.dark)
            Button("Light") {
                print("Light tap")
            }
        }
        .buttonStyle(.lab)
    }
}
