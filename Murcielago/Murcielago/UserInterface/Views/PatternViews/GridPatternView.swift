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
            model.turnOn()
        }
        .onTapGesture {
            model.turnOn()
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

    func turnOn() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.linear(duration: 2)) {
                self.turnOnCorners()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.linear(duration: 2)) {
                self.turnOnCenter()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.linear(duration: 2)) {
                self.turnOnAll()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.turnAllOff()
        }

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
