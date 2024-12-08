//
//  PercentageBarView.swift
//  Murcielago
//
//  Created by Sam Franusic on 12/2/24.
//

import SwiftUI

struct PercentageBarView: View {
    let value: CGFloat

    var body: some View {
        GeometryReader { reader in
            HStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.primary)
                    .frame(width: reader.size.width * value)
                Spacer(minLength: 0)
            }
        }
        .frame(height: 20)
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 3)
        }
    }
}

#Preview {
    VStack(alignment: .center, spacing: 15.0) {
        PercentageBarView(value: 0.25)
        PercentageBarView(value: 0.5)
        PercentageBarView(value: 0.9)
    }
    .preferredColorScheme(.dark)
}
