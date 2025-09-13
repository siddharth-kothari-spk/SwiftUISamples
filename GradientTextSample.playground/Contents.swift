import SwiftUI
import PlaygroundSupport

// Method 1: Basic SwiftUI View in Playground
struct MySwiftUIView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Method 1: Using foregroundStyle with LinearGradient (iOS 15+)
            Text("Gradient Text Method 1")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .cyan, .green],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            // Method 2: Using overlay with LinearGradient (iOS 13+)
            Text("Gradient Text Method 2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.clear)
                .overlay(
                    LinearGradient(
                        colors: [.purple, .pink, .orange],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .mask(
                        Text("Gradient Text Method 2")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    )
                )
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(20)
    }
}

PlaygroundPage.current.setLiveView(MySwiftUIView())
