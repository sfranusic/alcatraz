//  Created by Sam Franusic on 1/25/24.

import SwiftUI

struct EmojigmaTextView: View {
    @StateObject var model: EmojigmaTextViewModel
    var body: some View {
        ZStack {
            TextField("", text: $model.enteredText)
                .textFieldStyle(.emojigma)
        }
        .padding()
        .background {
            Color(.secondarySystemBackground)
        }
    }
}

struct EmojigmaTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background {
                Color(.tertiarySystemBackground)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(UIColor.systemFill), lineWidth: 2)
            }
    }
}

extension TextFieldStyle where Self == EmojigmaTextFieldStyle {
    static var emojigma: Self {
        .init()
    }
}

class EmojigmaTextViewModel: ObservableObject {
    @Published var enteredText = String()
}

struct EmojigmaTextView_Previews: PreviewProvider {
    static var previews: some View {
        EmojigmaTextView(model: EmojigmaTextViewModel())
            .preferredColorScheme(.dark)
    }
}
