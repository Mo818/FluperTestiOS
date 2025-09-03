//
//  User.swift
//  FluperTest
//
//  Created by Mohseen Shaikh on 03/09/2025.
//


struct UserModel: Identifiable, Decodable {
    let id: Int
    let name: String
    let email: String
    let username: String
}
