//
//  MessageListCell.swift
//  Product Marketplace
//
//  Created by Francisco Alderete on 24/04/2023.
//
import SwiftUI

struct MessageListCell: View {
    @EnvironmentObject var userState: UserState
    // 1
    let message: Message
    let sender: User
    // 2
    var senderAvatarKey: URL {
        URL(string: sender.id + ".jpg")!
    }
    var sendDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: message.createdAt?.foundationDate ?? .now)
    }
    
    var body: some View {

        HStack {
            AvatarView(state: .remote(avatarURL: senderAvatarKey))
                .frame(width: 30)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(sender.username)
                        .bold()
                    Text(sendDate)
                        .font(.footnote)
                    Spacer()
                }
                Text(message.body)
            }
        }
    }
}
