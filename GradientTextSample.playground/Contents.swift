import SwiftUI
import PlaygroundSupport

// Method 1: Basic SwiftUI View in Playground
struct MySwiftUIView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, Playground!")
                .font(.largeTitle)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .purple, .pink],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Button("Tap Me") {
                print("Button tapped in playground!")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(20)
    }
}

PlaygroundPage.current.setLiveView(MySwiftUIView())
