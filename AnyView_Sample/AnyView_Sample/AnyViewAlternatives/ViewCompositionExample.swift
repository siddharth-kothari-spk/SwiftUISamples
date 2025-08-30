//
//  ViewCompositionExample.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 30/08/25.
//

import SwiftUI

// ============================================
// 4. View Composition Pattern
// ============================================

// Break complex views into smaller, focused components
// This eliminates the need for complex conditionals

struct ViewCompositionExample: View {
    @State private var user: User = User.sample
    @State private var selectedSection: ProfileSection = .overview
    
    var body: some View {
        VStack {
            // Header component
            ProfileHeaderView(user: user)
            
            // Navigation component
            ProfileNavigationView(
                selectedSection: $selectedSection,
                availableSections: user.availableSections
            )
            
            // Content component - changes based on selection
            ProfileContentView(
                user: user,
                section: selectedSection
            )
            
            Spacer()
        }
        .padding()
    }
}

// Focused header component
struct ProfileHeaderView: View {
    let user: User
    
    var body: some View {
        HStack {
            AsyncImage(url: user.avatarURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .overlay(
                        Image(systemName: "person.fill")
                            .foregroundColor(.gray)
                    )
            }
            .frame(width: 80, height: 80)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(user.email)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                HStack {
                    Image(systemName: user.isVerified ? "checkmark.seal.fill" : "checkmark.seal")
                        .foregroundColor(user.isVerified ? .blue : .gray)
                    Text(user.isVerified ? "Verified" : "Unverified")
                        .font(.caption)
                        .foregroundColor(user.isVerified ? .blue : .gray)
                }
            }
            
            Spacer()
            
            Button("Edit") {
                // Edit action
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(12)
    }
}

// Navigation component
struct ProfileNavigationView: View {
    @Binding var selectedSection: ProfileSection
    let availableSections: [ProfileSection]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(availableSections, id: \.self) { section in
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selectedSection = section
                        }
                    }) {
                        VStack(spacing: 4) {
                            Image(systemName: section.iconName)
                                .font(.title3)
                            Text(section.displayName)
                                .font(.caption)
                        }
                        .foregroundColor(selectedSection == section ? .blue : .gray)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            selectedSection == section ?
                            Color.blue.opacity(0.1) : Color.clear
                        )
                        .cornerRadius(8)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal)
        }
    }
}

// Content component with focused subviews
struct ProfileContentView: View {
    let user: User
    let section: ProfileSection
    
    var body: some View {
        // Instead of AnyView, use @ViewBuilder with focused components
        contentForSection()
            .animation(.easeInOut, value: section)
    }
    
    @ViewBuilder
    private func contentForSection() -> some View {
        switch section {
        case .overview:
            ProfileOverviewContent(user: user)
        case .activity:
            ProfileActivityContent(user: user)
        case .settings:
            ProfileSettingsContent(user: user)
        case .achievements:
            ProfileAchievementsContent(user: user)
        }
    }
}

// Focused content components
struct ProfileOverviewContent: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            StatisticsRow(stats: user.statistics)
            
            Text("About")
                .font(.headline)
            Text(user.bio)
                .font(.body)
                .foregroundColor(.secondary)
            
            Text("Joined")
                .font(.headline)
            Text(user.joinDate.formatted(date: .abbreviated, time: .omitted))
                .font(.body)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(12)
    }
}

struct ProfileActivityContent: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Recent Activity")
                .font(.headline)
            
            ForEach(user.recentActivity, id: \.id) { activity in
                HStack {
                    Image(systemName: activity.iconName)
                        .foregroundColor(.blue)
                        .frame(width: 20)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(activity.title)
                            .font(.body)
                        Text(activity.date.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 4)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(12)
    }
}

struct ProfileSettingsContent: View {
    let user: User
    @State private var notifications = true
    @State private var privacy = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Settings")
                .font(.headline)
            
            VStack(spacing: 12) {
                Toggle("Push Notifications", isOn: $notifications)
                Toggle("Private Profile", isOn: $privacy)
                
                Button("Change Password") {
                    // Action
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Button("Delete Account") {
                    // Action
                }
                .foregroundColor(.red)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(12)
    }
}

struct ProfileAchievementsContent: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Achievements")
                .font(.headline)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 12) {
                ForEach(user.achievements, id: \.id) { achievement in
                    VStack(spacing: 8) {
                        Image(systemName: achievement.iconName)
                            .font(.largeTitle)
                            .foregroundColor(achievement.isUnlocked ? .yellow : .gray)
                        
                        Text(achievement.title)
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .background(
                        achievement.isUnlocked ?
                        Color.yellow.opacity(0.1) : Color.gray.opacity(0.05)
                    )
                    .cornerRadius(8)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(12)
    }
}

struct StatisticsRow: View {
    let stats: UserStatistics
    
    var body: some View {
        HStack(spacing: 20) {
            StatItem(title: "Posts", value: "\(stats.posts)")
            StatItem(title: "Followers", value: "\(stats.followers)")
            StatItem(title: "Following", value: "\(stats.following)")
        }
    }
}

struct StatItem: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.title3)
                .fontWeight(.bold)
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    ViewCompositionExample()
}


enum ProfileSection: String, CaseIterable {
    case overview, activity, settings, achievements
    
    var displayName: String {
        switch self {
        case .overview: return "Overview"
        case .activity: return "Activity"
        case .settings: return "Settings"
        case .achievements: return "Achievements"
        }
    }
    
    var iconName: String {
        switch self {
        case .overview: return "person.circle"
        case .activity: return "clock"
        case .settings: return "gear"
        case .achievements: return "trophy"
        }
    }
}

struct User {
    let name: String
    let email: String
    let bio: String
    let avatarURL: URL?
    let isVerified: Bool
    let joinDate: Date
    let statistics: UserStatistics
    let recentActivity: [Activity]
    let achievements: [Achievement]
    
    var availableSections: [ProfileSection] {
        ProfileSection.allCases
    }
    
    static let sample = User(
        name: "John Doe",
        email: "john.doe@example.com",
        bio: "Software developer passionate about creating amazing user experiences with SwiftUI and iOS development.",
        avatarURL: nil,
        isVerified: true,
        joinDate: Calendar.current.date(byAdding: .year, value: -2, to: Date()) ?? Date(),
        statistics: UserStatistics(posts: 42, followers: 128, following: 89),
        recentActivity: [
            Activity(id: "1", title: "Updated profile picture", date: Date(), iconName: "person.crop.circle"),
            Activity(id: "2", title: "Completed Swift certification", date: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), iconName: "graduationcap"),
            Activity(id: "3", title: "Joined iOS developers group", date: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), iconName: "person.3")
        ],
        achievements: [
            Achievement(id: "1", title: "Early Adopter", iconName: "star", isUnlocked: true),
            Achievement(id: "2", title: "Contributor", iconName: "heart", isUnlocked: true),
            Achievement(id: "3", title: "Expert", iconName: "crown", isUnlocked: false),
            Achievement(id: "4", title: "Mentor", iconName: "graduationcap", isUnlocked: false),
            Achievement(id: "5", title: "Pioneer", iconName: "flag", isUnlocked: false),
            Achievement(id: "6", title: "Leader", iconName: "person.badge.plus", isUnlocked: false)
        ]
    )
}

struct Achievement {
    let id: String
    let title: String
    let iconName: String
    let isUnlocked: Bool
}

struct Activity {
    let id: String
    let title: String
    let date: Date
    let iconName: String
}

struct UserStatistics {
    let posts: Int
    let followers: Int
    let following: Int
}
