//
//  GameSceneView.swift
//  Murcielago
//
//  Created by Sam Franusic on 12/9/24.
//

import RealityKit
import SwiftUI

//struct GameSceneView: UIViewRepresentable {
//    let sceneName: String
//
//    func makeUIView(context: Context) -> ARView{
//
//        guard let modelEntity = try? ModelEntity.load(named: sceneName) else {
//            fatalError("Failed to load scene")
//        }
//        let anchorEntity = AnchorEntity()
//        anchorEntity.addChild(modelEntity)
//        let arView = ARView(frame: .zero)
//        arView.scene.anchors.append(anchorEntity)
//
//        return arView
//    }
//
//    func updateUIView(_ uiView: ARView, context: Context) {
//
//    }
//}
//
//#Preview {
//    ZStack {
//        Color.primary
//            .ignoresSafeArea()
//        VStack {
//            Text("Start Game")
//            GameSceneView(sceneName: "foo")
//        }
//    }
//}
