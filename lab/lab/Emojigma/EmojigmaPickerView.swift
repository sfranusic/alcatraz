//  Created by Sam Franusic on 1/24/24.

import SwiftUI

struct EmojigmaPickerView: View {
    @StateObject var model: EmojigmaPickerModel

    var body: some View {
        HStack {
            Group {
                Picker("", selection: model.$rotor1) { wheelContent }
                Picker("", selection: model.$rotor2) { wheelContent }
                Picker("", selection: model.$rotor3) { wheelContent }
            }
            .pickerStyle(.wheel)
            .frame(width: 50, height: 100, alignment: .center)
            .background(Color(.tertiarySystemBackground))
            .clipped()
        }
    }

    private var wheelContent: some View {
        ForEach(EmojigmaPickerModel.emojiSet, id: \.self) { emoji in
            Text(emoji).tag(emoji)
        }
    }
}

// MARK: - Preview Mock
private struct MockEmojigmaPickerView: View {
    @StateObject var model = EmojigmaPickerModel()
    var body: some View {
        VStack {
            EmojigmaPickerView(model: model)
            HStack {
                Text(model.rotor1)
                Text(model.rotor2)
                Text(model.rotor3)
            }
        }
    }
}

#Preview {
    MockEmojigmaPickerView()
        .preferredColorScheme(.dark)
}
