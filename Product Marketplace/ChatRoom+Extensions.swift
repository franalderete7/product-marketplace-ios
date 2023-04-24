//
//  ChatRoom+Extensions.swift
//  Product Marketplace
//
//  Created by Francisco Alderete on 24/04/2023.
//

import Foundation

extension ChatRoom: Identifiable {}

extension ChatRoom: Hashable {
    public static func == (lhs: ChatRoom, rhs: ChatRoom) -> Bool {
        lhs.id == rhs.id &&
        lhs.memberIds == rhs.memberIds
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(memberIds)
    }
}

extension ChatRoom {
    func otherMemberId(currentUser id: String) -> String {
        let otherMemberId = self.memberIds?.first {
            $0 != id
        }
        return otherMemberId ?? ""
    }
}
