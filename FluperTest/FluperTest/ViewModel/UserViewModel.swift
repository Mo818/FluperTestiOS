//
//  UserViewModel.swift
//  FluperTest
//
//  Created by Mohseen Shaikh on 03/09/2025.
//


import Combine
import Foundation

//MARK: - User view model for business logic.

final class UserViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchUsers() {
        isLoading = true
        APIService.shared.fetchUsers { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let users):
                    self?.users = users
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    /// to search users once all are fetched.
    /// - Parameter query: filtered string users input
    func searchUsers(query: String) {
        if query.isEmpty {
            fetchUsers()
        } else {
            users = users.filter { $0.name.lowercased().contains(query.lowercased()) }
        }
    }
}
