//
//  SlideGalleryView.swift
//  Murcielago
//
//  Created by Sam Franusic on 11/8/24.
//

import SwiftUI

private enum ArrowButtonSize {
    static let height: CGFloat = 30
    static let spacing: CGFloat = 75
}

private enum SegmentIndicatorSize {
    static let height: CGFloat = 5
    static let spacing: CGFloat = 25
}

struct SlideGalleryView: View {
    @StateObject var model = SlideGalleryViewModel()

    var body: some View {
        VStack {
            galleryView
            controlView
            segmentIndicator
        }
    }

    @ViewBuilder private var selectedView: some View {
        switch model.selectedTag {
        case .spiral:
            SpiralPatternView()
        case .corners:
            GridPatternView()
        case .empty:
            EmptyView()
        }
    }

    private var galleryView: some View {
        VStack {
            Text("\(model.selectedTag.rawValue)")
                .font(.largeTitle)
            ZStack {
                Color.clear
                selectedView
            }
            .aspectRatio(1, contentMode: .fit)
            .overlay {
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            }
            .padding()
        }
    }

    private var controlView: some View {
        HStack(spacing: ArrowButtonSize.spacing) {
            Button {
                model.moveLeft()
            } label: {
                Image(systemName: "arrow.left")
                    .resizable()
                    .tint(.primary)
                    .aspectRatio(1, contentMode: .fit)
            }
            Button {
                model.moveRight()
            } label: {
                Image(systemName: "arrow.right")
                    .resizable()
                    .tint(.primary)
                    .aspectRatio(1, contentMode: .fit)
            }
        }
        .frame(height: ArrowButtonSize.height)
    }

    private var segmentIndicator: some View {
        HStack(spacing: SegmentIndicatorSize.spacing) {
            ForEach(0..<model.items.count, id: \.self) { index in
                Image(systemName: model.selected == index ? "circle.fill" : "circle")
            }
        }
        .padding([.vertical], SegmentIndicatorSize.spacing)
    }
}

class SlideGalleryViewModel: ObservableObject {
    let items = SchemeTag.allCases.map { $0.rawValue }
    private(set) var selected: Int = 0
    @Published private(set) var selectedTag: SchemeTag

    init(initialTag: SchemeTag = .spiral) {
        selectedTag = initialTag
    }

    func moveLeft() {
        if selected > 0 {
            selected -= 1
            guard let tag = SchemeTag(rawValue: items[selected]) else {
                assertionFailure("Failed to create tag")
                return
            }
            selectedTag = tag
        }
    }

    func moveRight() {
        if selected < items.count - 1 {
            selected += 1
            guard let tag = SchemeTag(rawValue: items[selected]) else {
                assertionFailure("Failed to create tag")
                return
            }
            selectedTag = tag
        }
    }
}

enum SchemeTag: String, CaseIterable {
    case spiral, corners, empty

    var localizedTitle: LocalizedStringKey {
        switch self {
        case .spiral: return "Spiral"
        case .corners: return "Corners"
        case .empty: return "Empty"
        }
    }
}

#Preview {
    SlideGalleryView()
        .preferredColorScheme(.dark)
}
