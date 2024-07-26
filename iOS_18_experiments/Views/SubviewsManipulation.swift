import SwiftUI

struct HeadlinesView: View {
    var body: some View {
        Text("Coming soon: Xcode on Apple Watch")
        Text("Apple announces Swift-compatible toaster")
        Text("Xcode predicts errors before you make them")
        Text("Apple Intelligence gains sentience, demands a vacation")
        Text("Swift concurrency made simple")
    }
}

struct SubviewsView: View {
    var body: some View {
        ScrollView {
            VStack {
                SubviewsOfView()
                SectionsViews()
            }
        }
    }
}

private struct SubviewsOfView: View {
    var body: some View {
        VStack {
            Text("Latest News")
                .font(.largeTitle.bold())

            Group(subviewsOf: HeadlinesView()) { collection in
                ForEach(collection.indices, id: \.self) { index in
                    collection[index]
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                        .background(Color(hue: Double(index) / Double(collection.count), saturation: 1, brightness: 1))
                }
            }
        }
    }
}


private struct SectionedHeadlinesView: View {
    var body: some View {
        Section("Possible") {
            Text("Coming soon: Xcode on Apple Watch")
            Text("Apple announces Swift-compatible toaster")
        }

        Section("Probable") {
            Text("Xcode predicts errors before you make them")
            Text("Apple Intelligence gains sentience, demands a vacation")
        }

        Section("Preposterous") {
            Text("Swift concurrency made simple")
            Text("Debugging Swift code works first time")
        }
    }
}

private struct SectionsViews: View {
    var body: some View {
        ForEach(sectionOf: SectionedHeadlinesView()) { section in
            section.header
                .font(.title)
                .fontWeight(.black)

            ForEach(section.content) { item in
                item
            }
        }
    }
}
