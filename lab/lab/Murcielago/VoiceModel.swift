//
//  VoiceModel.swift
//  lab
//
//  Created by Sam Franusic on 5/9/24.
//

import Foundation
import AVFoundation

actor VoiceModel {

    private let speechSynthesizer = AVSpeechSynthesizer()

    func readout(_ text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)

        speechUtterance.voice = AVSpeechSynthesisVoice(language: "es-MX")  // "en-US"
        speechUtterance.rate = 0.55
        speechSynthesizer.speak(speechUtterance)
    }
}
