//
//  SettingsView.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/12/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var mainModel: MainViewModel
    @State var settingOne: Bool = false

    var body: some View {
        VStack {
            List {
                Toggle("Setting One", isOn: $settingOne)
            }
            Button(
                action: {
                    mainModel.signOut()
                },
                label: {
                    Text("Sign Out")
                        .padding()
                }
            )
        }
        .tint(.murcielagoPrimary)
    }
}

#Preview {
    SettingsView()
        .preferredColorScheme(.dark)
        .environmentObject(MainViewModel())
}
