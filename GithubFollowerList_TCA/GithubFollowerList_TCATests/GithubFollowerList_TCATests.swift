//
//  GithubFollowerList_TCATests.swift
//  GithubFollowerList_TCATests
//
//  Created by Siddharth Kothari on 26/11/24.
//

import XCTest
@testable import GithubFollowerList_TCA
import ComposableArchitecture

final class GithubFollowerList_TCATests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    @MainActor
    func testFetchDataAction() async {
        let store = await TestStore(initialState: FollowerListFeature.State()) {
            FollowerListFeature()
        }
        
        let followers: [Follower] = [Follower(login: "test1", id: 1, nodeID: "", avatarURL: "", gravatarID: "", url: "", htmlURL: "", followersURL: "", followingURL: "", gistsURL: "", starredURL: "", subscriptionsURL: "", organizationsURL: "", reposURL: "", eventsURL: "", receivedEventsURL: "", type: "", siteAdmin: true),
        ]
        
        await store.send(.fetchData) {
            $0.isLoading = true
        }
        
        await store.send(.fetchDataSuccess(followers)) {
            $0.isLoading = false
            $0.followers = followers
        }
        
        XCTAssertFalse(store.state.isLoading)
        XCTAssertEqual(store.state.followers, followers)
        await store.finish(timeout: 1)
  }

}
