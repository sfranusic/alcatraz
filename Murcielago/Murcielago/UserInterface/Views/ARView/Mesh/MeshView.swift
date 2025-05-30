//
//  MeshView.swift
//  Murcielago
//
//  Created by Sam Franusic on 5/27/25.
//

import SwiftUI

struct MeshView: View {
    @State var isControllerPresented: Bool = false
    let model: MeshModel = MeshModel()

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Button {
                    isControllerPresented.toggle()
                } label: {
                    Image(systemName: "speaker")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)
                }
                .opacity(isControllerPresented ? 0 : 1)

            }
        }
        .sheet(
            isPresented: $isControllerPresented,
            content: {
                buttonController
            }
        )
    }

    var buttonController: some View {
        VStack {
            ForEach(0..<model.rows, id: \.self) { row in
                HStack {
                    ForEach(0..<model.columns, id: \.self) { column in
                        Button("\(row+1)-\(column+1)") {
                            print("\(row)\(column)")
                        }
                        .foregroundStyle(.white)
                        .frame(width: 75, height: 75)
                        .background(Color.blue)
                    }
                }
            }
        }
        .presentationDetents([.medium])
        .presentationBackground(Color.clear.opacity(0.25))
    }
}

#Preview {
    MeshView()
}
