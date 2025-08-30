//
//  ViewBuilderExamples.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 30/08/25.
//

import SwiftUI

struct ViewBuilderExamples: View {
    @State private var userType: UserType = .standard
    @State private var showDetails = false
    @State private var items: [String] = ["Item 1", "Item 2", "Item 3"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Basic conditional with @ViewBuilder
                conditionalContent()
                
                // Complex multi-condition with @ViewBuilder
                userSpecificContent()
                
                // Dynamic content generation
                dynamicItemList()
            }
            .padding()
        }
    }
    
    // Simple conditional content
    @ViewBuilder
    func conditionalContent() -> some View {
        VStack {
            Text("Conditional Content Example")
                .font(.headline)
            
            if showDetails {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Detail 1: Advanced information")
                    Text("Detail 2: More specific data")
                    Text("Detail 3: Technical specifications")
                    
                    Button("Hide Details") {
                        withAnimation {
                            showDetails = false
                        }
                    }
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(8)
                .transition(.opacity.combined(with: .slide))
            } else {
                Button("Show Details") {
                    withAnimation {
                        showDetails = true
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
    
    // Multi-condition handling
    @ViewBuilder
    func userSpecificContent() -> some View {
        VStack {
            Text("User-Specific Content")
                .font(.headline)
            
            Picker("User Type", selection: $userType) {
                ForEach(UserType.allCases, id: \.self) { type in
                    Text(type.rawValue.capitalized).tag(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            // Complex conditional logic without AnyView
            switch userType {
            case .guest:
                VStack {
                    Image(systemName: "person.crop.circle.dashed")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                    Text("Welcome, Guest!")
                    Text("Sign up to access more features")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Button("Sign Up") { /* Action */ }
                        .buttonStyle(.borderedProminent)
                }
                
            case .standard:
                VStack {
                    Image(systemName: "person.crop.circle")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                    Text("Standard User Dashboard")
                    HStack {
                        Button("Profile") { /* Action */ }
                        Button("Settings") { /* Action */ }
                    }
                    .buttonStyle(.bordered)
                }
                
            case .premium:
                VStack {
                    Image(systemName: "crown.fill")
                        .font(.largeTitle)
                        .foregroundColor(.orange)
                    Text("Premium User Dashboard")
                    Text("All features unlocked")
                        .font(.caption)
                    HStack {
                        Button("Analytics") { /* Action */ }
                        Button("Export") { /* Action */ }
                        Button("Priority Support") { /* Action */ }
                    }
                    .buttonStyle(.bordered)
                }
                
            case .admin:
                VStack {
                    Image(systemName: "gear.badge.checkmark")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                    Text("Administrator Panel")
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
                        Button("User Management") { /* Action */ }
                        Button("System Settings") { /* Action */ }
                        Button("Reports") { /* Action */ }
                        Button("Maintenance") { /* Action */ }
                    }
                    .buttonStyle(.bordered)
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(12)
    }
    
    // Dynamic content generation
    @ViewBuilder
    func dynamicItemList() -> some View {
        VStack {
            Text("Dynamic Item List")
                .font(.headline)
            
            ForEach(items.indices, id: \.self) { index in
                let item = items[index]
                
                // Different layouts based on index
                if index % 3 == 0 {
                    // Every 3rd item gets special treatment
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(item)
                            .font(.headline)
                        Spacer()
                    }
                    .padding()
                    .background(Color.yellow.opacity(0.2))
                    .cornerRadius(8)
                } else if index % 2 == 0 {
                    // Even items
                    HStack {
                        Text(item)
                        Spacer()
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.green)
                    }
                    .padding(.horizontal)
                } else {
                    // Odd items
                    Text(item)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(4)
                }
            }
        }
    }
}

#Preview {
    ViewBuilderExamples()
}

enum UserType: String, CaseIterable {
    case guest, standard, premium, admin
}
