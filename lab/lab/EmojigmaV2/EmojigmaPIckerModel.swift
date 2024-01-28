//  Created by Sam Franusic on 1/24/24.

import SwiftUI

class EmojigmaPickerModel: ObservableObject {
    @Published var rotorSelections: [String]

    init() {
        rotorSelections = [
            UserDefaults.standard.string(forKey: "firstRotorSelection") ?? emojiSet.first!,
            UserDefaults.standard.string(forKey: "secondRotorSelection") ?? emojiSet.first!,
            UserDefaults.standard.string(forKey: "thirdRotorSelection") ?? emojiSet.first!,
        ]
    }

    deinit {
        saveSelectionState()
    }

    func saveSelectionState() {
        UserDefaults.standard.setValue(rotorSelections[0], forKey: "firstRotorSelection")
        UserDefaults.standard.setValue(rotorSelections[1], forKey: "secondRotorSelection")
        UserDefaults.standard.setValue(rotorSelections[2], forKey: "thirdRotorSelection")
    }

    let emojiSet: [String] = [
        "🦝", "👻", "💎", "🦕", "🌊", "🐙", "🐼", "🌳", "🎏", "🍉", "❄️",
        "🐢", "☔️", "🍕", "🦈", "🚀", "🌱", "🍎", "🐝", "🐔", "🐶", "🐘",
        "🎃", "🍿", "🔑", "🎲", "🍭", "🌜"
    ]
}
