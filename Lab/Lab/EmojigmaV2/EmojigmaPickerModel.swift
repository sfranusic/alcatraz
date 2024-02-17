//
//  EmojigmaPickerModel.swift
//  Lab
//
//  Created by Sam Franusic on 2/16/24.
//

import SwiftUI

class EmojigmaPickerModel: ObservableObject {
    @Published var rotorSelections = [String]()
    @AppStorage("rotor1") var rotor1: String = ""
    @AppStorage("rotor2") var rotor2: String = ""
    @AppStorage("rotor3") var rotor3: String = ""

    init() {
        rotor1 = emojiSet.first ?? ""
        rotor2 = emojiSet.first ?? ""
        rotor3 = emojiSet.first ?? ""
        rotorSelections = [rotor1, rotor2, rotor3]
    }

    let emojiSet: [String] = [
        "🦝", "👻", "💎", "🦕", "🌊", "🐙", "🐼", "🌳", "🎏", "🍉", "❄️",
        "🐢", "☔️", "🍕", "🦈", "🚀", "🌱", "🍎", "🐝", "🐔", "🐶", "🐘",
        "🎃", "🍿", "🔑", "🎲", "🍭", "🌜"
    ]
}
