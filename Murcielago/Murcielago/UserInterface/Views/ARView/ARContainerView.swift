//
//  ARContainerView.swift
//  Murcielago
//
//  Created by Sam Franusic on 5/16/25.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let trackingConfiguration = ARWorldTrackingConfiguration()
        trackingConfiguration.planeDetection = [.horizontal]
        arView.session.run(trackingConfiguration)

        // Add grid of objects after a short delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            placeGrid(in: arView)
        }

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}

    func placeGrid(in arView: ARView) {
        let spacing: Float = 0.5 // meters
        let gridSize = (rows: 4, columns: 4)
        let distance: Float = -1.0

        for row in 0..<gridSize.rows {
            for column in 0..<gridSize.columns {
                let y = Float(row) * spacing - Float(gridSize.rows - 1) * spacing / 2
                let x = Float(column) * spacing - Float(gridSize.columns - 1) * spacing / 2
                let anchor = AnchorEntity(world: [x, y, distance])

                let box = ModelEntity(
                    mesh: .generateBox(size: 0.05),
                    materials: [SimpleMaterial(color: .blue, isMetallic: true)]
                )

                anchor.addChild(box)
                arView.scene.addAnchor(anchor)
            }
        }
    }
}
