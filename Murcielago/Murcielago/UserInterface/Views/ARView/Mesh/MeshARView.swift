//
//  MeshARView.swift
//  Murcielago
//
//  Created by Sam Franusic on 5/27/25.
//

import SwiftUI
import RealityKit
import ARKit

struct MeshARView: UIViewRepresentable {
    let model: MeshModel

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let trackingConfiguration = ARWorldTrackingConfiguration()
        trackingConfiguration.planeDetection = [.horizontal]
        arView.session.run(trackingConfiguration)

        // Add grid of objects after a short delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            setMeshEmitters(in: arView)
        }

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}

    func setMeshEmitters(in arView: ARView) {
        let spacing: Float = 0.5
        let distance: Float = -1.0
        let audioResource = model.audioControl.audioResource
        let entity = ModelEntity(
            mesh: .generateBox(size: 0.05),
            materials: [SimpleMaterial(color: .blue, isMetallic: true)]
        )

        for row in 0..<model.rows {
            for column in 0..<model.columns {
                let y = Float(row) * spacing - Float(model.rows - 1) * spacing / 2
                let x = Float(column) * spacing - Float(model.columns - 1) * spacing / 2
                let anchor = AnchorEntity(world: [x, y, distance])

                let emitter = MeshEmitterEntity(
                    row: row,
                    column: column,
                    entity: entity,
                    audioResource: audioResource
                )


                model.audioControl.addAudioController(for: emitter)
                anchor.addChild(emitter.entity)
                arView.scene.addAnchor(anchor)
            }
        }
    }
}
