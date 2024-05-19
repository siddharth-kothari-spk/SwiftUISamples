//
//  ContentView.swift
//  Test_JLLT
//
//  Created by Siddharth Kothari on 19/05/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = UserViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.users, id: \.id) { user in
                VStack(alignment: .leading) {
                                    Text(user.name)
                                        .font(.headline)
                    Text(user.address.city)
                                        .font(.body)
                                        .foregroundColor(.gray)
                                }
                
            }
            .navigationTitle("Users")
        }
    }
}

#Preview {
    ContentView()
}
