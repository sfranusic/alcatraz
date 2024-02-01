//  Created by Sam Franusic on 1/24/24.

import SwiftUI

class EmojigmaPickerModel: ObservableObject {
    @Published var picker1: String
    @Published var picker2: String
    @Published var picker3: String
    var pickerSet = [String]()

    init() {
        picker1 = UserDefaults.standard.string(forKey: "firstRotorSelection") ?? emojiSet.first!
        picker2 = UserDefaults.standard.string(forKey: "secondRotorSelection") ?? emojiSet.first!
        picker3 = UserDefaults.standard.string(forKey: "thirdRotorSelection") ?? emojiSet.first!
        pickerSet = [picker1, picker2, picker3]
    }

    deinit {
        saveSelectionState()
    }

    func saveSelectionState() {
        UserDefaults.standard.setValue(pickerSet[0], forKey: "firstRotorSelection")
        UserDefaults.standard.setValue(pickerSet[1], forKey: "secondRotorSelection")
        UserDefaults.standard.setValue(pickerSet[2], forKey: "thirdRotorSelection")
    }

    let emojiSet: [String] = [
        "🦝", "👻", "💎", "🦕", "🌊", "🐙", "🐼", "🌳", "🎏", "🍉", "❄️",
        "🐢", "☔️", "🍕", "🦈", "🚀", "🌱", "🍎", "🐝", "🐔", "🐶", "🐘",
        "🎃", "🍿", "🔑", "🎲", "🍭", "🌜"
    ]
}
