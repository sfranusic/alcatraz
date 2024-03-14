//
//  EmojigmaPickerModel.swift
//  Lab
//
//  Created by Sam Franusic on 2/16/24.
//

import SwiftUI

class EmojigmaPickerModel: ObservableObject {
    @AppStorage("rotor1") var rotor1: String = Lab().emojiSet.first!
    @AppStorage("rotor2") var rotor2: String = Lab().emojiSet.first!
    @AppStorage("rotor3") var rotor3: String = Lab().emojiSet.first!

    init() { }

    var emojiSet: [String] {
        Lab().emojiSet
    }

}
