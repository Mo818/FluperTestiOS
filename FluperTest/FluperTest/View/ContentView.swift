//
//  ContentView.swift
//  FluperTest
//
//  Created by Mohseen Shaikh on 03/09/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()
     @State private var searchText = ""
     
     var body: some View {
         NavigationView {
             VStack {
                 if viewModel.isLoading {
                     ProgressView("Loading...")
                 } else if let error = viewModel.errorMessage {
                     Text(error)
                         .foregroundColor(.red)
                 } else {
                     List(viewModel.users) { user in
                         NavigationLink(destination: UserDetailView(user: user)) {
                             VStack(alignment: .leading) {
                                 Text(user.name).font(.headline)
                                 Text(user.email).font(.subheadline).foregroundColor(.gray)
                             }
                         }
                     }
                     .refreshable {
                         viewModel.fetchUsers()
                     }
                 }
             }
             .searchable(text: $searchText, prompt: "Search users")
             .onChange(of: searchText) { newValue in
                 viewModel.searchUsers(query: newValue)
             }
             .navigationTitle("Users")
             .onAppear {
                 viewModel.fetchUsers()
             }
         }
     }}

#Preview {
    ContentView()
}
