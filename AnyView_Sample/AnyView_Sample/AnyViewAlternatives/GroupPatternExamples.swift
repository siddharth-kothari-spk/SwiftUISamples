//
//  GroupPatternExamples.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 30/08/25.
//

import SwiftUI

// ============================================
// 2. Group Pattern - Organizing Without Containers
// ============================================

// Group allows you to organize views without adding visual containers
// Perfect for conditional logic that doesn't need wrapper views

struct GroupPatternExamples: View {
    @State private var showAdvancedOptions = false
    @State private var selectedTab = 0
    @State private var isConnected = true
    
    var body: some View {
        VStack(spacing: 20) {
            // Group for conditional sections
            conditionalSections()
            
            // Group for organizing related content
            organizedContent()
            
            // Group for platform-specific content
            platformSpecificContent()
        }
        .padding()
    }
    
    @ViewBuilder
    func conditionalSections() -> some View {
        VStack {
            Text("Settings Panel")
                .font(.title2)
                .fontWeight(.bold)
            
            // Basic settings always shown
            Group {
                Toggle("Notifications", isOn: .constant(true))
                Toggle("Dark Mode", isOn: .constant(false))
                Toggle("Auto-sync", isOn: .constant(true))
            }
            .toggleStyle(SwitchToggleStyle())
            
            Divider()
            
            // Advanced settings conditionally shown
            Group {
                Toggle("Show Advanced", isOn: $showAdvancedOptions)
                
                if showAdvancedOptions {
                    Toggle("Debug Mode", isOn: .constant(false))
                    Toggle("Beta Features", isOn: .constant(false))
                    
                    VStack(alignment: .leading) {
                        Text("Cache Size")
                        Slider(value: .constant(0.3), in: 0...1)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Sync Frequency")
                        Picker("Frequency", selection: .constant(1)) {
                            Text("Real-time").tag(0)
                            Text("Every 5 minutes").tag(1)
                            Text("Hourly").tag(2)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
            }
            .animation(.easeInOut, value: showAdvancedOptions)
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(12)
    }
    
    @ViewBuilder
    func organizedContent() -> some View {
        VStack {
            Text("Organized Content with Group")
                .font(.headline)
            
            // Group helps organize related elements without visual containers
            Group {
                // Header section
                HStack {
                    Image(systemName: "person.circle")
                    Text("User Profile")
                    Spacer()
                    Button("Edit") { /* Action */ }
                }
                
                // Content section
                Text("John Doe")
                    .font(.title3)
                Text("Software Developer")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            
            Divider()
            
            // Another grouped section
            Group {
                HStack {
                    Image(systemName: "location")
                    Text("Location")
                    Spacer()
                }
                
                Text("San Francisco, CA")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
            }
        }
        .padding()
        .background(Color.blue.opacity(0.05))
        .cornerRadius(12)
    }
    
    @ViewBuilder
    func platformSpecificContent() -> some View {
        VStack {
            Text("Platform-Specific Features")
                .font(.headline)
            
            Group {
                #if os(iOS)
                VStack {
                    Text("iOS Features")
                    Button("Share via AirDrop") { /* Action */ }
                    Button("Add to Shortcuts") { /* Action */ }
                }
                #elseif os(macOS)
                VStack {
                    Text("macOS Features")
                    Button("Add to Dock") { /* Action */ }
                    Button("Create Alias") { /* Action */ }
                }
                #else
                VStack {
                    Text("Cross-Platform Features")
                    Button("Export Data") { /* Action */ }
                    Button("Sync Settings") { /* Action */ }
                }
                #endif
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .background(Color.green.opacity(0.05))
        .cornerRadius(12)
    }
}

#Preview {
    GroupPatternExamples()
}
