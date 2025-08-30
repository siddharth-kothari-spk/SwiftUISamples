//
//  StateDrivenExample.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 30/08/25.
//

import SwiftUI

// ============================================
// 7. State-Driven View Composition
// ============================================

// Use state to drive view composition instead of AnyView
enum LoadingState<T> {
    case idle
    case loading
    case loaded(T)
    case failed(Error)
}

struct StateDrivenExample: View {
    @State private var dataState: LoadingState<[String]> = .idle
    @State private var refreshTrigger = 0
    
    var body: some View {
        VStack {
            Text("State-Driven View Composition")
                .font(.headline)
            
            // No AnyView needed - ViewBuilder handles different states
            buildContentForState()
            
            Button("Load Data") {
                loadData()
            }
            .buttonStyle(.borderedProminent)
            .disabled(isLoading)
        }
        .padding()
        .refreshable {
            await refreshData()
        }
    }
    
    @ViewBuilder
    func buildContentForState() -> some View {
        switch dataState {
        case .idle:
            VStack(spacing: 16) {
                Image(systemName: "power.circle")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                Text("Ready to load data")
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color.gray.opacity(0.05))
            .cornerRadius(12)
            
        case .loading:
            VStack(spacing: 16) {
                ProgressView()
                    .scaleEffect(1.2)
                Text("Loading...")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color.blue.opacity(0.05))
            .cornerRadius(12)
            
        case .loaded(let data):
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Data Loaded Successfully")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("\(data.count) items")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                ForEach(data.indices, id: \.self) { index in
                    HStack {
                        Text("\(index + 1).")
                            .foregroundColor(.secondary)
                            .frame(width: 30, alignment: .trailing)
                        Text(data[index])
                        Spacer()
                    }
                    .padding(.vertical, 2)
                }
            }
            .padding()
            .background(Color.green.opacity(0.05))
            .cornerRadius(12)
            
        case .failed(let error):
            VStack(spacing: 16) {
                Image(systemName: "exclamationmark.triangle")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                
                Text("Failed to Load Data")
                    .font(.headline)
                    .foregroundColor(.red)
                
                Text(error.localizedDescription)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                
                Button("Retry") {
                    loadData()
                }
                .buttonStyle(.bordered)
            }
            .padding()
            .background(Color.red.opacity(0.05))
            .cornerRadius(12)
        }
    }
    
    private var isLoading: Bool {
        if case .loading = dataState {
            return true
        }
        return false
    }
    
    private func loadData() {
        dataState = .loading
        
        // Simulate network call
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if Bool.random() {
                // Simulate success
                dataState = .loaded([
                    "SwiftUI View Composition",
                    "Protocol-Oriented Design",
                    "Advanced ViewBuilder Techniques",
                    "State-Driven Architecture",
                    "Performance Optimization"
                ])
            } else {
                // Simulate failure
                struct NetworkError: Error {
                    let localizedDescription = "Failed to connect to server"
                }
                dataState = .failed(NetworkError())
            }
        }
    }
    
    private func refreshData() async {
        dataState = .loading
        try? await Task.sleep(nanoseconds: 1_500_000_000)
        
        dataState = .loaded([
            "Refreshed Data Item 1",
            "Refreshed Data Item 2",
            "Refreshed Data Item 3"
        ])
    }
}

#Preview {
    StateDrivenExample()
}
