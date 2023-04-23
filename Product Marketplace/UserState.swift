//
//  UserState.swift
//  Product Marketplace
//
//  Created by Francisco Alderete on 21/04/2023.
//

import Foundation
class UserState: ObservableObject {
    var userId: String = ""
    var username: String = ""
    
    var userAvatarURL: URL? {
           URL(string: "https://example.com/\(userAvatarKey)")
       }
    
    var userAvatarKey: String {
        userId + ".jpg"
    }
}
