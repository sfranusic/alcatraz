//  Created by Sam Franusic on 1/25/24.

import SwiftUI

struct EmojigmaMainView: View {
    @StateObject var model = EmojigmaMainViewViewModel()
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                EmojigmaPickerView(model: model.pickerModel)
            }
            EmojigmaTextView(model: model.textView)
                .onSubmit {
                    model.runEnigma()
//                    model.picker.saveSelectionState()
                }
        }
        .opacity(model.viewOpacity)
        .onAppear {
            model.fadeInView()
        }
    }
}

class EmojigmaMainViewViewModel: ObservableObject {
    let pickerModel = EmojigmaPickerModel()
    let textView = EmojigmaTextViewModel()
    @Published var viewOpacity: CGFloat = 0.0

    func fadeInView() {
        withAnimation(.linear(duration: 1)) { viewOpacity = 1.0 }
    }

    func runEnigma() {
        textView.enteredText = "\(textView.enteredText)\(pickerModel.picker1)"
    }
}

struct EmojigmaMainView_Previews: PreviewProvider {
    static var previews: some View {
        EmojigmaMainView()
            .preferredColorScheme(.dark)
    }
}
