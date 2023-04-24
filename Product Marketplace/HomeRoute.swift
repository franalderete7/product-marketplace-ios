//
//  HomeRoute.swift
//  Product Marketplace
//
//  Created by Francisco Alderete on 23/04/2023.
//

import Foundation

enum HomeRoute: Hashable {
    case productDetails(Product)
    case postNewProduct
    case chat(chatRoom: ChatRoom, otherUser: User, productId: String)
}

class HomeNavigationCoordinator: ObservableObject {
    @Published var routes: [HomeRoute] = []
}
