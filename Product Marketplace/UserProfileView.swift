//
//  UserProfileView.swift
//  Product Marketplace
//
//  Created by Francisco Alderete on 22/04/2023.
//
import Amplify
import SwiftUI
struct UserProfileView: View {
    @EnvironmentObject var userState: UserState
    let columns = Array(repeating: GridItem(.flexible(minimum: 150)), count: 2)
    
    var body: some View {
        // 1
        NavigationStack {
            // 2
            VStack {
                Button(action: {}) {
                    // 1
                    AvatarView(
                        state: .local(image: UIImage(systemName: "person")!)
                    )
                    .frame(width: 75, height: 75)
                }
                // 2
                Text(userState.username)
                    .font(.headline)
                // 3
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(0..<10) { i in
                            Color.red
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                }
            }
            .navigationTitle("My Account")
            // 3
            .toolbar {
                ToolbarItem {
                    Button(
                        action: {
                            Task {
                                await signOut()
                            }
                        },
                        label: { Image(systemName: "rectangle.portrait.and.arrow.right") }
                    )
                }
            }
        }
    }

    func signOut() async {
        do {
            // 1
            _ = await Amplify.Auth.signOut()
            print("Signed out")
            // 2
            _ = try await Amplify.DataStore.clear()
        } catch {
            print(error)
        }
    }
}
