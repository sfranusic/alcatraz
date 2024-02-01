//  Created by Sam Franusic on 1/24/24.

import SwiftUI

struct EmojigmaPickerView: View {
    @StateObject var model: EmojigmaPickerModel

    var body: some View {
        HStack {
            ForEach($model.pickerSelectionSet, id: \.self) { selection in
                Picker("", selection: selection) {
                    wheelContent
                }
                .pickerStyle(.wheel)
                .frame(width: 50, height: 100, alignment: .center)
                .background(Color(.tertiarySystemBackground))
                .clipped()
            }
        }
        .padding(10)
        .background {
            Color(.secondarySystemBackground)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }

    private var wheelContent: some View {
        ForEach(model.emojiSet, id: \.self) { emoji in
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
                ForEach(model.pickerSelectionSet, id: \.self) { item in
                    Text(item)
                }
            }
        }
    }
}
struct EmojigmaPickerView_Previews: PreviewProvider {
    static var previews: some View {
        MockEmojigmaPickerView()
            .preferredColorScheme(.dark)
    }
}
