//
//  MeshViewModel.swift
//  Murcielago
//
//  Created by Sam Franusic on 5/27/25.
//

import ARKit
import Foundation
import RealityKit
import SwiftUI

@MainActor
struct MeshAudioModel {
    private(set) var audioControllers: [String: AudioPlaybackController] = [:]

    mutating func addAudioController(for model: EmitterEntity) {
        guard let audioResource = model.audioResource else {
            assertionFailure("Attempting to add an audio controller for an emitter without an audio resource.")
            return
        }

        audioControllers[model.id] = model.entity.prepareAudio(audioResource)
    }

    mutating func playAudio(for model: EmitterEntity) {
        guard let audioResource = model.audioResource else {
            assertionFailure("Attempting to play audio for an emitter without an audio resource.")
            return
        }

        let controller = model.entity.playAudio(audioResource)
        audioControllers[model.id] = controller
    }

    mutating func stopAudio(for model: EmitterEntity) {
        audioControllers[model.id]?.stop()
        audioControllers[model.id] = nil
    }

    mutating func stopAllAudio() {
        for controller in audioControllers.values {
            controller.stop()
        }
        audioControllers.removeAll()
    }
}

struct EmitterEntity: Identifiable {
    let row: Int
    let column: Int
    var id: String {
        "\(row)\(column)"
    }
    let entity: ModelEntity
    var audioResource: AudioFileResource?
}
