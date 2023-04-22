//
//  AvatarView.swift
//  Product Marketplace
//
//  Created by Francisco Alderete on 21/04/2023.
//

import SwiftUI
import Kingfisher

enum AvatarState: Equatable {
    case remote(avatarURL: URL?)
    case local(image: UIImage)
}

struct AvatarView: View {
    let state: AvatarState
    
    init(state: AvatarState) {
        self.state = state
    }
    
    var body: some View {
        switch state {
        case .remote(let avatarURL):
            KFImage(avatarURL)
                .placeholder {
                    Image(systemName: "person")
                        .resizable()
                        .foregroundColor(.purple)
                        .padding(8)
                        .background(Color.init(white: 0.9))
                        .clipShape(Circle())
                }
                .setProcessor(RoundCornerImageProcessor(cornerRadius: 20))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                
        case .local(let image):
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
        }
    }
}

