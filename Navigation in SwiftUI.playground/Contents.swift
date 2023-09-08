// https://medium.com/@onmyway133/how-to-structure-navigation-in-swiftui-apps-384e5b9505f1

// programmatic routes with `NavigationStack

import SwiftUI

enum Route: Hashable {
    case authors
    case books
    case search
    case settings
}

// Define a view to switch on Route

struct RouteView: View {
    let route: Route
    
    var body: some View {
        switch route {
        case .authors:
            AuthorsView()
            
        case .books:
            BooksView()
            
        case .search:
            SearchView()
            
        case .settings:
            SettingsView()
        }
    }
}

struct AuthorsView: View {

    var body: some View {
        Text("")
    }
}

struct BooksView: View {
    
    var body: some View {
        Text("")
    }
}

struct SearchView: View {
    
    var body: some View {
        Text("")
    }
}

struct SettingsView: View {
    
    var body: some View {
        Text("")
    }
}

// Use a Router object to hold on an array of routes

final class Router: ObservableObject {
    @Published var routes: [Route] = []
    
    func navigate(to route: Route) {
        routes.append(route)
    }
}

// Declare Router for each navigation stack, and inject Router object inside environment so we can access it anywhere in the environment path

struct CompactView: View {
    @StateObject private var booksRouter = Router()
    
    var body: some View {
        TabView {
            NavigationStack(path: $booksRouter.routes) {
                BooksView()
                    .navigationDestination(for: Route.self) {
                        RouteView(route: route)
                    }
            }
            .environmentObject(booksRouter)
        }
    }
}
