//
//  SpiralPatternView.swift
//  Murcielago
//
//  Created by Sam Franusic on 9/13/24.
//

import SwiftUI

struct SpiralPatternView: View {
    @StateObject var outerModel = SpiralViewModel(emitters: 9)

    var body: some View {
        GeometryReader { reader in
            ZStack {
                RoundedRectangle(cornerRadius: 15.0)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.clear)
                ForEach(0..<outerModel.nodes.count, id: \.self) { index in
                    LevelView(degrees: outerModel.getAngleForNode(index))
                        .frame(width: reader.size.width * 0.15)
                        .offset(y: -reader.size.height * 0.4)
                        .rotationEffect(
                            .degrees(
                                outerModel.getAngleForNode(index)
                            )
                        )
                        .foregroundColor(
                            outerModel.nodes[index] 
                            ? .murcielagoPrimary
                            : .clear
                        )
                }
            }
            .padding()
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            outerModel.animateOn()
        }
        .onTapGesture {
            outerModel.animateOn()
        }
    }
}

struct LevelView: View {
    @State var degrees: Double = 0.0
    var body: some View {
        ZStack {
            Circle()
        }
    }
}

@MainActor
class SpiralViewModel: ObservableObject {
    @Published private(set) var nodes: [Bool]

    init(emitters: Int) {
        nodes = Array(repeating: false, count: emitters)
    }

    func animateOn() {
        for (index, _) in nodes.enumerated() {
            let animationTime: Double = 2.0/Double(nodes.count)
            let delay = Double(index) * animationTime
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                self.setNode(index, state: true)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                self.nodes = Array(repeating: false, count: self.nodes.count)
            }
        }
    }



    func setNode(_ node: Int, state: Bool) {
        guard node >= 0, node < nodes.count else {
            assertionFailure("Range issue")
            return
        }
        withAnimation(.linear(duration: 0.5)) {
            nodes[node] = state
        }
    }

    func getAngleForNode(_ nodeIndex: Int) -> Double {
        360.0/Double(nodes.count) * Double(nodeIndex)
    }

}

#Preview {
    SpiralPatternView()
}
