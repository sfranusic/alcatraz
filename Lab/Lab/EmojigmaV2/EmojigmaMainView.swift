//
//  EmojigmaMainView.swift
//  Lab
//
//  Created by Sam Franusic on 2/16/24.
//

import SwiftUI

struct EmojigmaMainView: View {
    @StateObject var model = EmojigmaMainViewViewModel()
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                EmojigmaPickerView(model: model.picker)
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
    let picker = EmojigmaPickerModel()
    let textView = EmojigmaTextViewModel()
    @Published var viewOpacity: CGFloat = 0.0

    func fadeInView() {
        withAnimation(.linear(duration: 1)) { viewOpacity = 1.0 }
    }

    func runEnigma() {
        textView.enteredText = "\(textView.enteredText)\(picker.rotor1)"
    }
}

#Preview {
    EmojigmaMainView()
        .preferredColorScheme(.dark)
}
