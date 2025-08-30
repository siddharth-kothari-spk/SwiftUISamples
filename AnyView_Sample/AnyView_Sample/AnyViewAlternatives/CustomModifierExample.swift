//
//  CustomModifierExample.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 30/08/25.
//

import SwiftUI

// ============================================
// 8. Custom View Modifiers Pattern
// ============================================

// Create reusable view modifiers instead of wrapping in AnyView

// Usage example of custom modifiers
struct CustomModifierExample: View {
    @State private var selectedCard: Int? = nil
    
    let cardData = [
        (title: "Primary Card", subtitle: "This is a primary card", style: CardStyle.primary),
        (title: "Secondary Card", subtitle: "This is a secondary card", style: CardStyle.secondary),
        (title: "Warning Card", subtitle: "This card shows a warning", style: CardStyle.warning),
        (title: "Danger Card", subtitle: "This card indicates danger", style: CardStyle.danger)
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Custom View Modifiers Example")
                .font(.headline)
            
            ForEach(cardData.indices, id: \.self) { index in
                let card = cardData[index]
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(card.title)
                        .font(.headline)
                    
                    Text(card.subtitle)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                // Using our custom modifier - no AnyView needed!
                .conditionalCard(
                    isHighlighted: selectedCard == index,
                    style: card.style
                )
                .onTapGesture {
                    withAnimation {
                        selectedCard = selectedCard == index ? nil : index
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    CustomModifierExample()
}


struct ConditionalCardModifier: ViewModifier {
    let isHighlighted: Bool
    let cardStyle: CardStyle
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .cornerRadius(12)
            .shadow(
                color: shadowColor,
                radius: shadowRadius,
                x: 0,
                y: shadowOffset
            )
            .scaleEffect(isHighlighted ? 1.02 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: isHighlighted)
    }
    
    private var backgroundColor: Color {
        switch cardStyle {
        case .primary:
            return isHighlighted ? Color.blue.opacity(0.1) : Color.gray.opacity(0.05)
        case .secondary:
            return isHighlighted ? Color.green.opacity(0.1) : Color.gray.opacity(0.03)
        case .warning:
            return isHighlighted ? Color.orange.opacity(0.1) : Color.yellow.opacity(0.05)
        case .danger:
            return isHighlighted ? Color.red.opacity(0.1) : Color.pink.opacity(0.05)
        }
    }
    
    private var borderColor: Color {
        guard isHighlighted else { return .clear }
        
        switch cardStyle {
        case .primary: return .blue
        case .secondary: return .green
        case .warning: return .orange
        case .danger: return .red
        }
    }
    
    private var borderWidth: CGFloat {
        isHighlighted ? 1 : 0
    }
    
    private var shadowColor: Color {
        guard isHighlighted else { return .clear }
        return .black.opacity(0.1)
    }
    
    private var shadowRadius: CGFloat {
        isHighlighted ? 8 : 0
    }
    
    private var shadowOffset: CGFloat {
        isHighlighted ? 2 : 0
    }
}

enum CardStyle {
    case primary, secondary, warning, danger
}

// Extension to make the modifier easier to use
extension View {
    func conditionalCard(
        isHighlighted: Bool = false,
        style: CardStyle = .primary
    ) -> some View {
        modifier(ConditionalCardModifier(
            isHighlighted: isHighlighted,
            cardStyle: style
        ))
    }
}
