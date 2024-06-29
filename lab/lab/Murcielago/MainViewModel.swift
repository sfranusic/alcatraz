//
//  MainViewModel.swift
//  lab
//
//  Created by Sam Franusic on 5/17/24.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    @Published var coverVisible: Double = 0
    @Published var networkError = false
    private let camera: CameraModel
//    private let classifier: ClassifierModel
    private let voice: VoiceModel

    init(
        cameraModel: CameraModel = CameraModel(),
//        classifierModel: ClassifierModel = ClassifierModel(),
        voiceModel: VoiceModel = VoiceModel()
    ) {
        self.camera = cameraModel
//        self.classifier = classifierModel
        self.voice = voiceModel
    }

    func animateInterface() {
        coverVisible = 1
        withAnimation(.easeIn(duration: 1.5)) {
            coverVisible = 0
        }
    }

    func speak(_ text: String = " ") async {
        await voice.readout(text)
    }
}
