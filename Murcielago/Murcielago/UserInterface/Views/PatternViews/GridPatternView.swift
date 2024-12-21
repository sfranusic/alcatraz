//
//  GridPatternView.swift
//  Murcielago
//
//  Created by Sam Franusic on 10/22/24.
//

import SwiftUI

struct GridPatternView: View {
    @StateObject var model = GridModel()
    var body: some View {
        VStack {
            ForEach(0..<model.rows, id: \.self) { row in
                HStack {
                    ForEach(0..<model.columns, id: \.self) { column in
                        Rectangle()
                            .fill(
                                model.state[row][column]
                                ? .murcielagoPrimary
                                : .clear
                            )
                            .aspectRatio(contentMode: .fit)

                    }
                }
            }
        }
        .padding()
        .onAppear {
            Task {
                await model.animateAppearance()
            }
        }
        .onTapGesture {
            Task {
                await model.animateAppearance()
            }
        }
    }
}

@MainActor
class GridModel: ObservableObject {
    let rows = 4
    let columns = 4
    @Published private(set) var state: [[Bool]]

    init() {
        state = Array(repeating: Array(repeating: false, count: columns), count: rows)
    }

    func animateAppearance() async {
        // Corner animation
        try? await Task.sleep(for: .seconds(1))
        withAnimation(.linear(duration: 2)) {
            turnOnCorners()
        }

        // Center animation
        try? await Task.sleep(for: .seconds(1))
        withAnimation(.linear(duration: 2)) {
            turnOnCenter()
        }

        // All cells animation
        try? await Task.sleep(for: .seconds(1))
        withAnimation(.linear(duration: 2)) {
            turnOnAll()
        }

        // Reset
        try? await Task.sleep(for: .seconds(2))
        turnAllOff()
    }

    func turnOnCorners() {
        state[0][0] = true
        state[0][columns - 1] = true
        state[rows - 1][0] = true
        state[rows - 1][columns - 1] = true
    }

    func turnOnCenter() {
        state[1][1] = true
        state[1][2] = true
        state[2][1] = true
        state[2][2] = true
    }

    func turnOnAll() {
        state = Array(repeating: Array(repeating: true, count: columns), count: rows)
    }

    private func turnAllOff() {
        state = Array(repeating: Array(repeating: false, count: columns), count: rows)
    }
}

#Preview {
    GridPatternView()
}
