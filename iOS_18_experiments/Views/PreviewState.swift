import SwiftUI

struct PreviewDemoView: View {
    @State var text: String
    var body: some View {
        VStack {
            Text("Preview Demo")
                .font(.largeTitle)
            TextField("Username", text: $text)
                .frame(height: 60)
                .padding(.horizontal)
                .background(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2).fill(.blue))
                .foregroundColor(.black)
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var username = ""
    PreviewDemoView(text: username)
}
