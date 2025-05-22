//
//  EchoMeshViewModel.swift
//  Murcielago
//
//  Created by Sam Franusic on 5/21/25.
//

import ARKit
import Foundation
import RealityKit
import SwiftUI

struct EchoMeshViewModel {
    private let rows: Int = 4
    private let columns: Int = 4
    private let spacing: Float = 0.4
    private let distance: Float = -1.0
    private var audio: AudioFileResource?
    private var activeAudioController: AudioPlaybackController?
    private(set) var entities: [[ModelEntity]] = []

    @MainActor
    init() {
        setUpAudio()
        setUpEntities()
    }

    @MainActor @discardableResult
    mutating func playSound(row: Int, column: Int) -> Bool {
        guard row >= 0, row < rows, column >= 0, column < columns else {
            return false
        }

        if let active = activeAudioController {
            active.stop()
        }

        guard let audio else {
            return false
        }

        let entity = entities[row][column]
        activeAudioController = entity.playAudio(audio)
        return activeAudioController?.isPlaying ?? false
    }

    @MainActor
    mutating private func setUpAudio() {
        guard
            let audioSource = try? AudioFileResource.load(
                named: "echo-chime.wav",
                in: nil,
                inputMode: .spatial,
                loadingStrategy: .preload
            )
        else {
            assertionFailure("Audio loading failed")
            return
        }

        audio = audioSource
    }

    @MainActor
    mutating private func setUpEntities() {
        for row in 0..<rows {
            for column in 0..<columns {

                let box = ModelEntity(
                    mesh: .generateBox(size: 0.05),
                    materials: [SimpleMaterial(color: .blue, isMetallic: true)]
                )

                entities[row][column] = box
            }
        }
    }
}
