//
//  ProductGridCell.swift
//  Product Marketplace
//
//  Created by Francisco Alderete on 23/04/2023.
//

import SwiftUI
import Kingfisher

struct ProductGridCell: View {
    
    let product: Product
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            KFImage.url(URL(string: product.imageKey))
                .scaledToFill()
            Text("$\(product.price)")
                .bold()
                .foregroundColor(.white)
                .padding(4)
                .background(Color(white: 0.1, opacity: 0.6))
        }
    }
}

