//
//  InboxListCell.swift
//  Product Marketplace
//
//  Created by Francisco Alderete on 24/04/2023.
//

import Kingfisher
import SwiftUI

struct InboxListCell: View {
    // 1
    let otherChatRoomMember: User
    let lastMessage: LastMessage
    
    // 2
    var otherUsersAvatarKey: String {
        otherChatRoomMember.id + ".jpg"
    }
    var productImageKey: String {
        lastMessage.productId + ".jpg"
    }
    var lastMessageDate: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .short
        return formatter.localizedString(
            for: lastMessage.dateTime.foundationDate,
            relativeTo: .now
        )
    }
    
    var body: some View {
        // 3
        HStack {
            KFImage.url(
                URL(string: "https://your-domain.com/images/\(otherUsersAvatarKey)")
            )
            .placeholder {
                Image(systemName: "person.crop.circle")
            }
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(lastMessage.body)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(otherChatRoomMember.username)
                    .font(.subheadline)
                
                Text(lastMessageDate)
            }
            
            Spacer()
            
            KFImage.url(
                URL(string: "https://your-domain.com/images/\(productImageKey)")
            )
            .placeholder {
                Image(systemName: "photo")
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 50)
        }
    }
}
