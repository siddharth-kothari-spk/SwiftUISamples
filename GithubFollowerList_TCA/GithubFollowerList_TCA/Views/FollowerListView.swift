//
//  ContentView.swift
//  GithubFollowerList_TCA
//
//  Created by Siddharth Kothari on 26/11/24.
//

// Building a GitHub Follower List App with TCA and SwiftUI


import SwiftUI
import ComposableArchitecture

struct FollowerListView: View {
    // The Store represents the runtime of your feature. That is, it is the object that can process actions in order to update state, and it can execute effects and feed data from those effects back into the system.
    // The store can be held onto as a let. Observation of the data in the store happens automatically with the ObservableState() macro.
    
    let store: StoreOf<FollowerListFeature>
    
    var body: some View {
            List {
                ForEach(store.followers, id: \.self) { follower in
                    HStack(content: {
                        
                        AsyncImage(url: URL(string: follower.avatarURL)) { image in
                            image.resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                        } placeholder: {
                            ProgressView()
                        }

                        Text(follower.login)
                    })
                }
            }
            .onAppear {
                store.send(.fetchData)
            }
        }
}

//#Preview {
//    FollowerListView(store: .init(initialState: <#T##Reducer.State#>, reducer: <#T##() -> Reducer#>))
//}
