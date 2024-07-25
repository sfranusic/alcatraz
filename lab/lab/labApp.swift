//  Created by Sam Franusic on 8/31/23.

import SwiftUI

@main
struct labApp: App { //swiftlint:disable:this type_name
    var body: some Scene {
        WindowGroup {
            StopLightView()
                .preferredColorScheme(.dark)
        }
    }
}
