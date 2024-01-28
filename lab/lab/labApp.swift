//  Created by Sam Franusic on 8/31/23.

import SwiftUI

@main
struct labApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                List {
                    NavigationLink("Emojigma") {
                        EmojigmaMainView()
                    }
                }
                .font(.system(size: 24))
            }
            .navigationViewStyle(.stack)
        }
    }
}
