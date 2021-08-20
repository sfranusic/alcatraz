//
//  Color+Random.swift
//  Mesmerize
//
//  Created by Sammy Franusic on 8/16/21.
//

import Foundation
import SwiftUI

extension Color {
    public static var random: Color {
        var randomRGBValue: Double {
            Double.random(in: 0...255)/255
        }
        return Color(.sRGB, red: randomRGBValue, green: randomRGBValue, blue: randomRGBValue, opacity: 1)
    }
}
