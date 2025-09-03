//
//  APIError.swift
//  FluperTest
//
//  Created by Mohseen Shaikh on 03/09/2025.
//
import Foundation

//MARK: - Below class will call the API and returns the response.
final class APIService {
    static let shared = APIService()
    private init() {}
    
    func fetchUsers(completion: @escaping (Result<[UserModel], APIError>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                completion(.failure(.requestFailed))
                return
            }
            guard let data = data else {
                completion(.failure(.requestFailed))
                return
            }
            do {
                let UserModels = try JSONDecoder().decode([UserModel].self, from: data)
                completion(.success(UserModels))
            } catch {
                completion(.failure(.decodingFailed))
            }
        }.resume()
    }
}

//MARK: - Enum to handle api fail cases
enum APIError: Error, LocalizedError {
    case invalidURL
    case requestFailed
    case decodingFailed
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .requestFailed: return "Network request failed"
        case .decodingFailed: return "Failed to decode response"
        }
    }
}
