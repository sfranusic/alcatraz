//
//  SettingsView.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/12/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var mainModel: MainViewModel

    var body: some View {
        VStack {
            Section(header: Text("Settings")) {
                NavigationStack {
                    List {
                        NavigationLink("Game Controller Settings", destination: GameControllerSettingsView())
                    }
                    Button(
                        action: {
                            mainModel.signOut()
                        },
                        label: {
                            Text("Sign Out")
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(lineWidth: 2.0)
                                        .padding([.horizontal], 25)
                                }


                        }
                    )
                    versionLabel
                }
            }
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
