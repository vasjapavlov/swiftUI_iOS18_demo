import SwiftUI

struct ViewSizeAndPositionView: View {
    @State private var textFrame = CGRect.zero
    @State private var textSize = 17.0

    var body: some View {
        VStack {
            Text("Hello, world")
                .font(.system(size: textSize))
                .onGeometryChange(for: CGRect.self) { proxy in
                    proxy.frame(in: .global)
                } action: { newValue in
                    textFrame = newValue
                }

            Rectangle()
                .frame(width: textFrame.width, height: textFrame.height)

            Slider(value: $textSize, in: 10...30)
                .padding()
        }
    }
}
