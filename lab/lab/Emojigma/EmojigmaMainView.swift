//
//  EmojigmaMainView.swift
//  Lab
//
//  Created by Sam Franusic on 2/16/24.
//

import SwiftUI

struct EmojigmaMainView: View {
    @StateObject var viewModel = EmojigmaMainViewViewModel()
    var body: some View {
        VStack(spacing: 5) {
            Group {
                EmojigmaPickerView(model: viewModel.picker)
                EmojigmaTextView(model: viewModel.textView)
                    .onSubmit {
                        viewModel.runEnigma()
                    }
            }
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(UIColor.systemFill), lineWidth: 2)
            }
        }
        .opacity(viewModel.viewOpacity)
        .padding(.horizontal, 5)
        .onAppear {
            viewModel.fadeInView()
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
