//
//  ColoredSquareRow.swift
//  Mesmerize
//
//  Created by Sammy Franusic on 8/14/21.
//

import SwiftUI

struct ColoredSquareRow: View {
    var body: some View {
        HStack {
            ForEach(0..<3) { _ in
                ColoredSquareView()
            }
        }
    }
}

struct ColoredSquareRow_Previews: PreviewProvider {
    static var previews: some View {
        ColoredSquareRow()
    }
}
