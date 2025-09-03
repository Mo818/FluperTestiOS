//
//  UserDetailView.swift
//  FluperTest
//
//  Created by Mohseen Shaikh on 03/09/2025.
//
import SwiftUI

struct UserDetailView: View {
    let user: UserModel
    
    var body: some View {
        VStack {
            // Rectangular card
            VStack(alignment: .leading, spacing: 12) {
                Text(user.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Divider()
                
                HStack {
                    Text("Username:")
                        .fontWeight(.semibold)
                    Text("@\(user.username)")
                }
                
                HStack {
                    Text("Email:")
                        .fontWeight(.semibold)
                    Text(user.email)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray6))
                    .shadow(radius: 4)
            )
            .padding()
            
            Spacer()
        }
        .navigationTitle("Details")
    }
}
#Preview {
    UserDetailView(user: UserModel(id: 1, name: "demo name", email: "demo@gmail.com", username: "user"))
}
