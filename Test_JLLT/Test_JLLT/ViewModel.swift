//
//  ViewModel.swift
//  Test_JLLT
//
//  Created by Siddharth Kothari on 19/05/24.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    private var cancellable: AnyCancellable?
    
    init(cancellable: AnyCancellable? = nil) {
        self.cancellable = cancellable
        fetchUsers()
    }
    
    func fetchUsers() {
        var urllink = "https://jsonplaceholder.typicode.com/users"
        
        guard let url = URL(string: urllink) else { return }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data) // Extract data from response
            .decode(type: [User].self, decoder: JSONDecoder()) // Decode JSON into array of User
            .replaceError(with: []) // Replace errors with an empty array
            .receive(on: DispatchQueue.main) // Receive on main queue to update UI
            .sink(receiveValue: {[weak self] users in
                self?.users = users // Update users with fetched data
            })
    }
}

