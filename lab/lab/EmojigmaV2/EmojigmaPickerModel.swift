//  Created by Sam Franusic on 1/24/24.

import SwiftUI

class EmojigmaPickerModel: ObservableObject {
    @Published var picker1: String
    @Published var picker2: String
    @Published var picker3: String
    var pickerSelectionSet = [String]()

    init() {
        picker1 = UserDefaults.standard.string(forKey: "firstRotorSelection") ?? emojiSet.first!
        picker2 = UserDefaults.standard.string(forKey: "secondRotorSelection") ?? emojiSet.first!
        picker3 = UserDefaults.standard.string(forKey: "thirdRotorSelection") ?? emojiSet.first!
        pickerSelectionSet = [picker1, picker2, picker3]
    }

    deinit {
        saveSelectionState()
    }

    func saveSelectionState() {
        UserDefaults.standard.setValue(pickerSelectionSet[0], forKey: "firstRotorSelection")
        UserDefaults.standard.setValue(pickerSelectionSet[1], forKey: "secondRotorSelection")
        UserDefaults.standard.setValue(pickerSelectionSet[2], forKey: "thirdRotorSelection")
    }

    let emojiSet: [String] = [
        "🦝", "👻", "💎", "🦕", "🌊", "🐙", "🐼", "🌳", "🎏", "🍉", "❄️",
        "🐢", "☔️", "🍕", "🦈", "🚀", "🌱", "🍎", "🐝", "🐔", "🐶", "🐘",
        "🎃", "🍿", "🔑", "🎲", "🍭", "🌜"
    ]
}
