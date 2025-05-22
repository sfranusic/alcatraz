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
    private(set) var entities: [[ModelEntity]] = []

    @MainActor
    private var audioSource: AudioFileResource? {
        try? AudioFileResource.load(
                named: "click.wav",
                in: nil,
                inputMode: .spatial,
                loadingStrategy: .preload
        )
    }

    @MainActor
    func generateEntities() {
        guard let audioSource else {
            assertionFailure("Audio loading failed")
            return
        }
        
        for row in 0..<rows {
            for column in 0..<columns {

                let box = ModelEntity(
                    mesh: .generateBox(size: 0.05),
                    materials: [SimpleMaterial(color: .blue, isMetallic: true)]
                )


            }
        }
    }
}
