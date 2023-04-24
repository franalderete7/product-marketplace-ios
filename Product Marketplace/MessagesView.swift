//
//  MessagesView.swift
//  Product Marketplace
//
//  Created by Francisco Alderete on 24/04/2023.
//

import SwiftUI
struct MessagesView: View {
    @EnvironmentObject var userState: UserState
    @State var messages: [Message] = []
    @State var messageBody: String = ""
    
    // 3
    let chatRoom: ChatRoom
    let otherUser: User
    let productId: String?
    
    init(chatRoom: ChatRoom, otherUser: User, productId: String? = nil) {
        self.chatRoom = chatRoom
        self.otherUser = otherUser
        self.productId = productId ?? chatRoom.lastMessage?.productId
    }
    
    var body: some View {
        VStack {
            // 4
            List(messages) { message in
                let sender = message.messageSenderId == userState.userId
                ? User(id: userState.userId, username: userState.username)
                : otherUser
                MessageListCell(message: message, sender: sender)
                    .flip()
            }
            .listStyle(.plain)
            .flip()
            
            // 5
            HStack {
                TextField("Message", text: $messageBody)
                Button("Send", action: {})
            }
            .padding()
        }
        .navigationTitle(otherUser.username)
        .navigationBarTitleDisplayMode(.inline)
    }
}
extension View {
    // 6
    func flip() -> some View {
        return self
            .rotationEffect(.radians(.pi))
            .scaleEffect(x: -1, y: 1, anchor: .center)
    }
}
