//
//  ContentView.swift
//  iOS_18_experiments
//
//  Created by Vasja Pavlov on 2024-07-25.
//

import SwiftUI

enum Item: Hashable, CaseIterable {
    case textRenderer
    case zoomView
    case mixedColors
    case mesh
    case viewSizeAndPositionChanges
    case scrollToPos
    case scrollMoveOrIdle
    case subviewsManipulation
    case previewDemo
    case sfSymbolAnimations

    var title: String {
        switch self {
        case .textRenderer: return "Text Renderer"
        case .zoomView: return "Zoom View"
        case .mixedColors: return "Mixing colors"
        case .mesh: return "Mesh gradients"
        case .viewSizeAndPositionChanges: return "View size and position changes"
        case .scrollToPos: return "Scroll to position"
        case .scrollMoveOrIdle: return "Detect ScrollView movement"
        case .subviewsManipulation: return "Subviews manipulation"
        case .previewDemo: return "Preview demo"
        case .sfSymbolAnimations: return "SFSymbol animations"
        }
    }

    var icon: String {
        switch self {
        case .textRenderer: return "pencil"
        case .zoomView: return "plus.magnifyingglass"
        case .mixedColors: return "paintpalette"
        case .mesh: return "circle.grid.3x3"
        case .viewSizeAndPositionChanges: return "shippingbox.and.arrow.backward.fill"
        case .scrollToPos: return "scroll"
        case .scrollMoveOrIdle: return "figure.run"
        case .subviewsManipulation: return "square.on.square"
        case .previewDemo: return "viewfinder.circle"
        case .sfSymbolAnimations: return "lizard"
        }
    }
}

struct ContentView: View {
    @State var text: String = ""
    var body: some View {
        NavigationStack {
            List(Item.allCases, id: \.self) { item in
                NavigationLink(value: item) {
                    Cell(item.title, item.icon) {
                        print("da")
                    }
                }
            }
            .navigationDestination(for: Item.self, destination: { item in
                switch item {
                case .textRenderer:
                    TextRendererView()
                case .zoomView:
                    ZoomAnimationsView()
                case .mixedColors:
                    MixedColorsView()
                case .mesh:
                    MeshView()
                case .viewSizeAndPositionChanges:
                    ViewSizeAndPositionView()
                case .scrollToPos:
                    ScrollToPositionView()
                case .scrollMoveOrIdle:
                    ScrollMoveOrIdleView()
                case .subviewsManipulation:
                    SubviewsView()
                case .previewDemo:
                    PreviewDemoView(text: text)
                case .sfSymbolAnimations:
                    SFSymbolAnimationsView()
                }
            })
            /*
             .navigationDestination(for: String.self, destination: { discipline in
               DetailView(discipline: discipline)
             })
             */
            .navigationBarTitle("La magia di iOS 18")
        }
    }
}

struct Cell: View {
    let title: String
    let icon: String
    let action: () -> Void
    init(
        _ title: String,
        _ icon: String,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
        self.icon = icon
    }

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.largeTitle)
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .fill(.cyan)
                    )
                    .symbolEffect(.rotate, value: true)

                Text(title)
            }
        }
    }
}

#Preview {
    ContentView()
}
