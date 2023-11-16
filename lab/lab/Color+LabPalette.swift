//  Created by Sam Franusic on 11/15/23.

import SwiftUI

extension Color {
    static var labRed: Self { Color("Lab Red") } // Cosmos Chocolate/Salmon Pink
    static var labGreen: Self { Color("Lab Green") } // Dark Green/Mantis
    static var labBlue: Self { Color("Lab Blue") } // Federal Blue/Powder Blue
    static var labTriadicSet: [Color] = [.labRed, .labGreen, .labBlue]
    static var primarySurface: Self { Color("Primary Surface") }
    static var buttonTextColor: Self { Color("Button Text Color") }
}
