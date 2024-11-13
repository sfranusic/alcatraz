//
//  SettingsView.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/12/24.
//

import SwiftUI

struct SettingsView: View {
    @State var settingOne: Bool = false

    var body: some View {
        List {
            Toggle("Setting One", isOn: $settingOne)
        }
        .tint(.murcielagoPrimary)
    }
}

#Preview {
    SettingsView()
}
