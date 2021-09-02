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
    public static var randomBlue: Color {
        let blues: [Color] = [
            Color("Blue1"),
            Color("Blue2"),
            Color("Blue3"),
            Color("Blue4"),
            Color("Blue5"),
            Color("Blue6")
        ]
        return blues.randomElement() ?? .blue
    }
    public static var randomPink: Color {
        let pinks: [Color] = [
            Color("Pink1"),
            Color("Pink2"),
            Color("Pink3"),
            Color("Pink4"),
            Color("Pink5"),
            Color("Pink6")
        ]
        return pinks.randomElement() ?? .pink
    }
}
