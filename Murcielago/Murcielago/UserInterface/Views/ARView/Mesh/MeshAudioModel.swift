//
//  MeshAudioModel.swift
//  Murcielago
//
//  Created by Sam Franusic on 5/27/25.
//

import ARKit
import Foundation
import RealityKit
import SwiftUI

@MainActor
class MeshAudioModel {
    private(set) var audioControllers: [String: AudioPlaybackController] = [:]
    let audioFileName = "echo-chime.wav"

    var audioResource: AudioResource {
        guard
            let resource = try? AudioFileResource.load(
                named: audioFileName,
                in: nil,
                inputMode: .spatial,
                loadingStrategy: .preload
            )
        else {
            fatalError("Audio loading failed")
        }
        return resource
    }

    func addAudioController(for model: MeshEmitterEntity) {
        audioControllers[model.id] = model.entity.prepareAudio(model.audioResource)
    }

    /// Attempts to play an existing controller in the model.
    func playAudio(for id: String) {
        guard let controller = audioControllers[id] else {
            assertionFailure("Attempting to play audio for an emitter that does not exist.")
            return
        }
        controller.play()
    }

    func playAudio(for model: MeshEmitterEntity) {
        let controller = model.entity.playAudio(model.audioResource)
        audioControllers[model.id] = controller
    }

    func stopAudio(for model: MeshEmitterEntity) {
        audioControllers[model.id]?.stop()
        audioControllers[model.id] = nil
    }

    func stopAllAudio() {
        for controller in audioControllers.values {
            controller.stop()
        }
        audioControllers.removeAll()
    }
}

struct MeshEmitterEntity: Identifiable {
    let row: Int
    let column: Int
    var id: String {
        "\(row)\(column)"
    }
    let entity: ModelEntity
    let audioResource: AudioResource
}
