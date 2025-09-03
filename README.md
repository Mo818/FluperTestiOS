# FluperTestiOS
Fluper iOS test
A simple iOS app built with Swift and MVVM architecture that fetches and displays a list of users from the JSONPlaceholder API.
🚀 Features
Fetch users from public API using URLSession (no external libraries).
Display users in a List with name & email.
Pull-to-refresh to reload users.
Search users by name.
Detail screen with a rectangular card showing user info.
Clean MVVM separation (Model, ViewModel, View).
Error handling with user-friendly messages.
🏗️ Project Structure
Model → User struct (Decodable).
ViewModel → UserViewModel (handles networking & state).
Networking → APIService for API requests.
View → SwiftUI views (ContentView, UserDetailView).
📸 Screenshots
User List Screen – Shows all users with search & refresh.
Details Screen – Displays user details in a card view.
⚙️ Requirements
iOS 15+
Xcode 13+
Swift 5+
▶️ Running the App
Clone the repo:
git clone https://github.com/yourusername/MVVMUserListApp.git
Open in Xcode.
Build & run on Simulator or device
