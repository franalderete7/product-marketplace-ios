//
//  ProductDetailsView.swift
//  Product Marketplace
//
//  Created by Francisco Alderete on 23/04/2023.
//
import Amplify
import Kingfisher
import SwiftUI

struct ProductDetailsView: View {
    @EnvironmentObject var userState: UserState
    @EnvironmentObject var navigationCoordinator: HomeNavigationCoordinator
    @Environment(\.dismiss) var dismiss
    let product: Product
    
    var body: some View {
        ScrollView {
            VStack {
                // Use KFImage to load image
                KFImage(URL(string: product.imageKey))
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .clipped()
                
                Text("$\(product.price)")
                    .font(.largeTitle)
                
                product.productDescription.flatMap(Text.init)
                
                if userState.userId != product.userId {
                    Button("Chat") {
                        Task { await getOrCreateChatRoom() }
                    }
                } else {
                    Button("Delete product") {
                        Task { await deleteProduct() }
                    }
                }
            }
            .navigationTitle(product.name)
        }
    }
    func deleteProduct() async {
        do {
            try await Amplify.DataStore.delete(product)
            print("Deleted product \(product.id)")
            
            let productImageKey = product.id + ".jpg"
            try await Amplify.Storage.remove(key: productImageKey)
            print("Deleted file: \(productImageKey)")
            
            dismiss.callAsFunction()
        } catch {
            print(error)
        }
    }
    func getOrCreateChatRoom() async {
        do {
            // 1
            let chatRooms = try await Amplify.DataStore.query(
                ChatRoom.self,
                where: ChatRoom.keys.memberIds.contains(product.userId)
                    && ChatRoom.keys.memberIds.contains(userState.userId)
            )
            
            // 2
            let chatRoom: ChatRoom
            if let existingChatRoom = chatRooms.first {
                chatRoom = existingChatRoom
            } else {
                let newChatRoom = ChatRoom(memberIds: [product.userId, userState.userId])
                let savedChatRoom = try await Amplify.DataStore.save(newChatRoom)
                chatRoom = savedChatRoom
            }
            
            // 3
            let otherUser = try await Amplify.DataStore.query(
                User.self,
                byId: chatRoom.otherMemberId(currentUser: userState.userId)
            )
            
        } catch {
            print(error)
        }
    }
}

