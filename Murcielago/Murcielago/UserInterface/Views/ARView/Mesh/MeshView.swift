//
//  MeshView.swift
//  Murcielago
//
//  Created by Sam Franusic on 5/27/25.
//

import SwiftUI

struct MeshView: View {
    @State var isControllerPresented: Bool = false
    let model = MeshModel()

    var body: some View {
        ZStack {
            MeshARView(model: model)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Button {
                    isControllerPresented.toggle()
                } label: {
                    Image(systemName: "speaker")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
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
            Spacer()
            ForEach(0..<model.rows, id: \.self) { row in
                HStack {
                    ForEach(0..<model.columns, id: \.self) { column in
                        Button(
                            action: {
                                print("\(row)\(column)")
                                model.audioControl.playAudio(for: "\(row)\(column)")
                            },
                            label: {
                                Text("\(row+1)-\(column+1)")
                                    .frame(
                                        minWidth: 45,
                                        idealWidth: 60,
                                        maxWidth: .infinity,
                                        minHeight: 45,
                                        idealHeight: 60,
                                        maxHeight: .infinity,
                                        alignment: .center
                                    )
                            }
                        )
                        .foregroundStyle(.white)
                        .background(Color.blue)
                    }
                }
            }
            Spacer(minLength: 20)
            Button {
                isControllerPresented = false
            } label: {
                Image(systemName: "chevron.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 20, maxWidth: .infinity)
                    .frame(height: 20)
            }

        }
        .presentationDetents([.medium])
        .presentationBackground(Color.clear.opacity(0.25))
    }
}

#Preview {
    MeshView()
}
