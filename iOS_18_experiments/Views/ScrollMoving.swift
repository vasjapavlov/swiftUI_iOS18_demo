import SwiftUI
struct ScrollMoveOrIdleView: View {
    @State private var backgroundColor = Color.red

    var body: some View {
        ScrollView {
            backgroundColor
                .frame(height: 2000)
        }
        .onScrollPhaseChange { oldPhase, newPhase in
            if newPhase == .interacting {
                backgroundColor = .green
            } else {
                backgroundColor = .red
            }
        }
    }
}
