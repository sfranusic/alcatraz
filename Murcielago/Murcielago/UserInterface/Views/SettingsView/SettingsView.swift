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
            versionLabel
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

    private var bundleShortVersion: String {
        Bundle
            .main
            .infoDictionary?["CFBundleShortVersionString"]
        as? String ?? "x"
    }

    private var versionLabel: some View {
        HStack {
            Text("Version")
            Text(bundleShortVersion)
        }
    }
}

#Preview {
    SettingsView()
        .preferredColorScheme(.dark)
        .environmentObject(MainViewModel())
}
