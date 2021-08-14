//
//  SquareGalleryView.swift
//  Mesmerize
//
//  Created by Sammy Franusic on 8/11/21.
//

import SwiftUI

struct SquareGalleryView: View {
    var body: some View {
        VStack {
            ForEach(0..<7) { _ in
                ColoredSquareRow()
            }
        }
    }
}

struct SquareGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        SquareGalleryView()
    }
}
