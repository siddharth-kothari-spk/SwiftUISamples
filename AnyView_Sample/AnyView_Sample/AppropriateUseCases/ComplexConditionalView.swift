//
//  PluginContainer.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 29/08/25.
//

import SwiftUI

// ✅ APPROPRIATE: Complex conditional rendering with different layouts
struct ComplexConditionalView: View {
    @State private var userRole: UserRole = .guest
    @State private var deviceType: DeviceType = .phone
    
    var body: some View {
        adaptiveContent()
    }
    
    func adaptiveContent() -> AnyView {
        switch (userRole, deviceType) {
        case (.admin, .desktop):
            return AnyView(AdminDesktopDashboard())
        case (.admin, .tablet):
            return AnyView(AdminTabletView())
        case (.user, .desktop):
            return AnyView(UserDesktopView())
        case (.user, .tablet), (.user, .phone):
            return AnyView(UserMobileView())
        case (.guest, _):
            return AnyView(GuestWelcomeView())
        case (.admin, .phone):
            return AnyView(AdminPhoneView())
        }
    }
}

#Preview {
    ComplexConditionalView()
}

enum UserRole {
    case admin, user, guest
}

enum DeviceType {
    case phone, tablet, desktop
}

struct AdminDesktopDashboard: View {
    var body: some View { Text("Admin Desktop Dashboard") }
}

struct AdminTabletView: View {
    var body: some View { Text("Admin Tablet View") }
}

struct AdminPhoneView: View {
    var body: some View { Text("Admin Phone View") }
}

struct UserDesktopView: View {
    var body: some View { Text("User Desktop View") }
}

struct UserMobileView: View {
    var body: some View { Text("User Mobile View") }
}

struct GuestWelcomeView: View {
    var body: some View { Text("Guest Welcome View") }
}
