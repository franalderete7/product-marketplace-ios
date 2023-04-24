//
//  MainTabView.swift
//  Product Marketplace
//
//  Created by Francisco Alderete on 22/04/2023.
//

import SwiftUI
struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            InboxView()
                .tabItem {
                    Label("Inbox", systemImage: "message")
                }

            UserProfileView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
    }
}
