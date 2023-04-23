//
//  ProductDetailsView.swift
//  Product Marketplace
//
//  Created by Francisco Alderete on 23/04/2023.
//

import Kingfisher
import SwiftUI

struct ProductDetailsView: View {
    @EnvironmentObject var userState: UserState
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
                    Button("Chat", action: {})
                } else {
                    Button("Delete product", action: {})
                }
            }
            .navigationTitle(product.name)
        }
    }
}

