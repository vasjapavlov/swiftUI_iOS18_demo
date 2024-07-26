import SwiftUI

struct MixedColorsView: View {
    @State private var firstColor = Color.red
    @State private var secondColor = Color.indigo
    @State private var blendAmount = 0.5

    var body: some View {
        VStack {
            ColorPicker("From", selection: $firstColor)
            ColorPicker("To", selection: $secondColor)
            Slider(value: $blendAmount)

            Rectangle()
                .fill(firstColor.mix(with: secondColor, by: blendAmount))
        }
        .padding()
    }
}
