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
            HStack {
                ColoredSquareView()
                ColoredSquareView()
                ColoredSquareView()
            }
            HStack {
                ColoredSquareView()
                ColoredSquareView()
                ColoredSquareView()
            }
            HStack {
                ColoredSquareView()
                ColoredSquareView()
                ColoredSquareView()
            }

        }
        .aspectRatio(contentMode: .fit)
    }
}

struct SquareGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        SquareGalleryView()
    }
}
