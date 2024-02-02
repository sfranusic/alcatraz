//  Created by Sam Franusic on 1/24/24.

import SwiftUI

class EmojigmaPickerModel: ObservableObject {
    @Published var picker1: String
    @Published var picker2: String
    @Published var picker3: String

    init() {
        picker1 = UserDefaults.standard.string(forKey: "firstRotorSelection") ?? emojiSet.first!
        picker2 = UserDefaults.standard.string(forKey: "secondRotorSelection") ?? emojiSet.first!
        picker3 = UserDefaults.standard.string(forKey: "thirdRotorSelection") ?? emojiSet.first!
    }

    deinit {
        saveSelectionState()
    }

    func saveSelectionState() {
        UserDefaults.standard.setValue(picker1, forKey: "firstRotorSelection")
        UserDefaults.standard.setValue(picker2, forKey: "secondRotorSelection")
        UserDefaults.standard.setValue(picker3, forKey: "thirdRotorSelection")
    }

    let emojiSet: [String] = [
        "🦝", "👻", "💎", "🦕", "🌊", "🐙", "🐼", "🌳", "🎏", "🍉", "❄️",
        "🐢", "☔️", "🍕", "🦈", "🚀", "🌱", "🍎", "🐝", "🐔", "🐶", "🐘",
        "🎃", "🍿", "🔑", "🎲", "🍭", "🌜"
    ]
}
