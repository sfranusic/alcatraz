//
//  LightView.swift
//  lab
//
//  Created by Sam Franusic on 6/10/24.
//

import SwiftUI

struct LightView: View {
    @StateObject var model: LightViewModel

    var body: some View {
        Circle()
            .fill(
                model.isOn ? model.lightColor : .black
            )
            .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/(duration: 0.5), value: model.isOn)
    }
}

#Preview {
    LightView(model: LightViewModel(.green))
}
