import SwiftUI

struct MeshView: View {
    var body: some View {
        VStack {
            MeshGradient(width: 2, height: 2, points: [
                [0, 0], [1, 0], [0, 1], [1, 1]
            ], colors: [.red, .green, .blue, .yellow])

            TimelineView(.animation) { timeline in
                let x = (sin(timeline.date.timeIntervalSince1970) + 1) / 2

                MeshGradient(width: 3, height: 3, points: [
                    [0, 0], [0.5, 0], [1, 0],
                    [0, 0.5], [Float(x), 0.5], [1, 0.5],
                    [0, 1], [0.5, 1], [1, 1]
                ], colors: [
                    .red, .red, .red,
                    .red, .orange, .red,
                    .red, .red, .red
                ])
            }

            Image(systemName: "bubbles.and.sparkles.fill")
                .font(.system(size: 144, weight: .black))
                .foregroundStyle(
                    MeshGradient(width: 2, height: 2, points: [
                        [0, 0], [1, 0],
                        [0, 1], [1, 1]
                    ], colors: [
                        .indigo, .cyan,
                        .purple, .pink
                    ])
                )
        }
    }
}