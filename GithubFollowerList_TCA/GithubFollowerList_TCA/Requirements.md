# Requirements

We'll create a simple iOS app using TCA and SwiftUI that:

i) Fetches a list of the user's GitHub followers.
ii) Displays the list in a SwiftUI view.
iii) Navigates to the GitHub profile of a selected follower

## Overview: Core Components in TCA

For this app, we'll need the following core components:

1. State:

    isLoading: A Boolean to indicate if data is being fetched.
    followers: An array of Follower structs.
    error: An optional Error to handle errors.

2. Action:

    fetchData: Triggered to fetch follower data.
    fetchDataSuccess: Triggered on successful data fetch.
    fetchDataFailure: Triggered on failed data fetch.
    selectFollower: Triggered when a follower is selected.

3. Reducer:

    Handles state updates based on actions.
    Triggers effects for fetching follower data.

4. Effect:

    Fetches follower data from the GitHub API.

5. Environment:

    Contains dependencies like the URLSession for network requests.

## API Doc

github documentation: https://docs.github.com/en/rest/users/followers?apiVersion=2022-11-28#list-the-people-a-user-follows
api used:  https://api.github.com/users/USERNAME/following
