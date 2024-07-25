//  Created by Sam Franusic on 8/31/23.

import SwiftUI

@main
struct labApp: App { //swiftlint:disable:this type_name

    @StateObject var controllerModel = ControllerModel()
    var body: some Scene {
        WindowGroup {
            MockControllerView()
                .environmentObject(controllerModel)
                .preferredColorScheme(.dark)
        }
    }
}
