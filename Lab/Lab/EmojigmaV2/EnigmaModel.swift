//
//  EnigmaModel.swift
//  Lab
//
//  Created by Sam Franusic on 2/18/24.
//

import Foundation

class EnigmaModel {
    let emojiSet: [String]

    init(emojiSet: [String]) {
        guard emojiSet.count == alphabet.count else {
            fatalError("Emoji set must not be empty")
        }
        self.emojiSet = emojiSet
    }

    var reflector: [String: String] {
        guard emojiSet.count == alphabet.count else {
            return [:]
        }
        var reflector = [String: String]()
        var endIndex = emojiSet.count - 1
        var startIndex = 0
        while startIndex < endIndex {
            reflector[emojiSet[startIndex]] = emojiSet[endIndex]
            reflector[emojiSet[endIndex]] = emojiSet[startIndex]
            startIndex += 1
            endIndex -= 1
        }
        return reflector
    }

    var plugboardA: [String: String] {
        var plugboard: [String: String] = [:]
        for index in 0..<emojiSet.count {
            plugboard[alphabet[index]] = emojiSet[index]
        }
        return plugboard
    }

    var plugboardE: [String: String] {
        var plugboard: [String: String] = [:]
        for index in 0..<emojiSet.count {
            plugboard[emojiSet[index]] = alphabet[index]
        }
        return plugboard
    }

    let alphabet = [
        "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
        "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
        "W", "X", "Y", "Z", " ", "Ñ"
    ]

    var customEmojiSet = [String]()
    var emojiSetSorted = [String]()
    var r1OR = [String]()
    var r2OR = [String]()
    var r3OR = [String]()

}
