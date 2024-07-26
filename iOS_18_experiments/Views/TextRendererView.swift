import SwiftUI

struct TextRendererView: View {
    var body: some View {
        VStack {
            BoxedRendererView()
                .padding()
            WaveRendererView()
                .padding()
            QuakeRendererView()
        }
    }
}

private struct BoxedRenderer: TextRenderer {
    func draw(layout: Text.Layout, in context: inout GraphicsContext) {
        for line in layout {
            for run in line {
                for glyph in run {
                    context.stroke(Rectangle().path(in: glyph.typographicBounds.rect), with: .color(.blue), lineWidth: 2)
                }

                context.stroke(Rectangle().path(in: run.typographicBounds.rect), with: .color(.green), lineWidth: 2)
            }

            context.stroke(Rectangle().path(in: line.typographicBounds.rect), with: .color(.red), lineWidth: 2)

            context.draw(line)
        }
    }
}

private struct WaveRenderer: TextRenderer {
    var strength: Double
    var frequency: Double

    var animatableData: Double {
        get { strength }
        set { strength = newValue }
    }

    func draw(layout: Text.Layout, in context: inout GraphicsContext) {
        for line in layout {
            for run in line {
                for (index, glyph) in run.enumerated() {
                    let yOffset = strength * sin(Double(index) * frequency)
                    var copy = context

                    copy.translateBy(x: 0, y: yOffset)
                    copy.draw(glyph, options: .disablesSubpixelQuantization)
                }
            }
        }
    }
}

private struct QuakeRenderer: TextRenderer {
    var moveAmount: Double

    var animatableData: Double {
        get { moveAmount }
        set { moveAmount = newValue }
    }

    func draw(layout: Text.Layout, in context: inout GraphicsContext) {
        for line in layout {
            for run in line {
                for glyph in run {
                    var copy = context
                    let yOffset = Double.random(in: -moveAmount...moveAmount)

                    copy.translateBy(x: 0, y: yOffset)
                    copy.draw(glyph, options: .disablesSubpixelQuantization)
                }
            }
        }
    }
}

private struct WaveRendererView: View {
    @State private var amount = -10.0

    var body: some View {
        Text("This is a very important string with lots of text inside. This is a very important string with lots of text inside.")
            .font(.largeTitle)
            .textRenderer(WaveRenderer(strength: amount, frequency: 0.5))
            .onAppear {
                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                    amount = 10
                }
            }
    }
}

private struct BoxedRendererView: View {
    var body: some View {
        VStack {
            (
                Text("This is a **very** important string") +
                Text(" with lots of text inside.")
                    .foregroundStyle(.secondary)
            )
            .font(.largeTitle)
            .textRenderer(BoxedRenderer())
        }
    }
}

private struct QuakeRendererView: View {
    @State private var strength = 0.0

    var body: some View {
        Text("SHOCKWAVE")
            .font(.largeTitle.weight(.black).width(.compressed))
            .textRenderer(QuakeRenderer(moveAmount: strength))
            .onAppear {
                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                    strength = 10
                }
            }
    }
}

#Preview {
    VStack {
        BoxedRendererView()
            .padding()
        WaveRendererView()
            .padding()
        QuakeRendererView()
    }
}
