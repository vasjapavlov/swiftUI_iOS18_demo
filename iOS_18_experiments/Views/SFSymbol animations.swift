import SwiftUI

struct SFSymbolAnimationsView: View {

    var body: some View {
        VStack(spacing: 15) {
            BounceView()
            InboxView()
            RotationView()
            SpeedyView()
            MultiView1()
            Heartview()
        }
    }
}

struct MultiView1: View {
    @State private var animationsRunning = false

    var body: some View {

        Button("Start Animations") {
            withAnimation {
                animationsRunning.toggle()
            }
        }
        .font(.largeTitle)

        VStack {
            HStack {
                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.iterative, value: animationsRunning)

                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.cumulative, value: animationsRunning)

                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.reversing.iterative, value: animationsRunning)

                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.reversing.cumulative, value: animationsRunning)
            }

            HStack {
                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.iterative, options: .repeating, value: animationsRunning)

                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.cumulative, options: .repeat(3), value: animationsRunning)

                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.reversing.iterative, options: .speed(3), value: animationsRunning)

                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.reversing.cumulative, options: .repeat(3).speed(3), value: animationsRunning)
            }
        }
        .font(.largeTitle)
    }
}

struct Heartview: View {
        @State private var isFavorite = false

        var body: some View {
            VStack {
                Button {
                    withAnimation {
                        isFavorite.toggle()
                    }
                } label: {
                    Label("Toggle Favorite", systemImage: isFavorite ? "checkmark": "heart")
                }
                .contentTransition(.symbolEffect(.replace))
            }
            .font(.largeTitle)
        }
}

struct RotationView: View {
    @State private var animate = false

    var body: some View {
        Button {
            animate.toggle()
        } label: {
            HStack {
                Image(systemName: "arrow.clockwise.square")
                    .symbolEffect(.rotate, value: animate)
                Text("Refresh")
            }
            .font(.largeTitle)
        }
    }
}

struct SpeedyView: View {
    @State private var isFavorite = false

    var body: some View {
        Button {
            isFavorite.toggle()
        } label: {
            Label("DHL Inbox", systemImage: "mail.stack")
        }
        .symbolEffect(.bounce, options: .speed(3).repeat(3), value: isFavorite)
        .font(.largeTitle)
    }
}

struct BounceView: View {
    @State private var petCount = 0
    var body: some View {
        Button {
            petCount += 1
        } label: {
            Label("Can i pet that Dawg?", systemImage: "dog")
        }
        .symbolEffect(.bounce, value: petCount)
        .font(.largeTitle)
    }
}

struct InboxView: View {
    @State private var isFavorite = false

    var body: some View {
        Button {
            isFavorite.toggle()
        } label: {
            Label("Regular inbox", systemImage: "mail.stack")
        }
        .symbolEffect(.bounce.down, value: isFavorite)
        .font(.largeTitle)
    }
}
