//
//  Rotor.swift
//  emojicode
//
//  Created by Sam Franusic on 6/3/15.
//  Copyright (c) 2015 Sam Franusic. All rights reserved.
//

import Foundation

class Rotor {
    private let emojiSet = EmojigmaPickerModel.emojiSet
    private var connectionMap = [String: String]()
    private var connectionMapBackwards = [String: String]()
    private(set) var notch = 0 {
        didSet {
            if oldValue >= emojiSet.count - 1 {
                notch = 0
            }
        }
    }
    private(set) var notch2 = 0 {
        didSet {
            if oldValue >= emojiSet.count - 1 {
                notch2 = 0
                notch += 1
            }
        }
    }

    init(notch: Int = 0, notch2: Int = 0) {
        self.notch = notch
        self.notch2 = notch2
        setRotorConnections()
    }

    private func setRotorConnections() {
        for emoji in emojiSet {
            connectionMap[emoji] = emojiSet[notch]
            connectionMapBackwards[emojiSet[notch]] = emoji
        }
    }

    private func updateRotorConnections() {
        notch += 1
        notch2 += 1
        setRotorConnections()
    }

    func connectionForward(_ emoji: String) -> String {
        guard let value = connectionMap[emoji] else {
            assertionFailure("Connection setup failed")
            return ""
        }
        updateRotorConnections()

        return value
    }

    func connectionBackward(_ emoji: String) -> String {
        guard let value = connectionMapBackwards[emoji] else {
            assertionFailure("Connection setup failed")
            return ""
        }
        updateRotorConnections()

        return value
    }

}

//class Rotor {
//    var innerRing = emojiSet
//    var outerRing = emojiSet
//    var connection = [String: String]()
//    var connectionBackwards = [String: String]()
//    var notch = 0
//    var notch2 = 0
//    func set() {
//        for item in innerRing {
//            if notch >= outerRing.count {notch = 0}
//            if notch2 >= outerRing.count {notch2 = 0; notch += 1}
//            connection[item] = outerRing[notch]
//            notch += 1
//            connectionBackwards[connection[item]!] = item
//            if notch >= outerRing.count {notch = 0}
//            if notch2 >= outerRing.count {notch2 = 0; notch += 1}
//        }
//    }
//    func change(_ letter: String) -> String {
//        let s = connection[letter]!
////        notch++
////        set()
//        return s
//    }
//    func changeBackwards(_ letter: String) -> String {
//        let s = connectionBackwards[letter]!
////                notch++
////                set()
//        return s
//    }
//}
