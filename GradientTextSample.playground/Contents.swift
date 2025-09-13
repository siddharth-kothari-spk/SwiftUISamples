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
            
            // Method 3: horizontal gradient
            Text("Horizontal gradient")
                .font(.system(size: 32, weight: .medium))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.purple, .cyan, .blue],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            // Method 4: Vertical gradient
            Text("Vertical Gradient")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.red, .yellow, .green],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            // Method 5: Radial gradient
            HStack {
                
                Text("Radial Gradient")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(
                        RadialGradient(
                            colors: [.yellow, .green, .red],
                            center: .center,
                            startRadius: 10,
                            endRadius: 100
                        )
                    )
                Spacer()
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(
                        RadialGradient(
                            colors: [.yellow, .green, .red],
                            center: .center,
                            startRadius: 10,
                            endRadius: 50
                        )
                    )
            }
            
            // Method 6: Angular gradient
            HStack {
                Text("Angular Gradient")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(
                        AngularGradient(
                            colors: [.red, .orange, .yellow, .green, .blue, .purple, .red],
                            center: .center,
                            startAngle: .degrees(0),
                            endAngle: .degrees(360)
                        )
                    )
                
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(
                        AngularGradient(
                            colors: [.red, .orange, .yellow, .green, .blue, .purple, .red],
                            center: .center,
                            startAngle: .degrees(0),
                            endAngle: .degrees(360)
                        )
                    )
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(20)
    }
}

PlaygroundPage.current.setLiveView(MySwiftUIView())
