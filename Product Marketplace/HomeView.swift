//
//  HomeView.swift
//  Product Marketplace
//
//  Created by Francisco Alderete on 23/04/2023.
//

import SwiftUI
struct HomeView: View {
    @StateObject var navigationCoordinator: HomeNavigationCoordinator = .init()
    @State var products: [Product] = []
    
    let columns = Array(repeating: GridItem(.flexible(minimum: 150)), count: 2)
    
    var body: some View {
        NavigationStack(path: $navigationCoordinator.routes) {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(products) { product in
                        NavigationLink(value: HomeRoute.productDetails(product)) {
                            ProductGridCell(product: product)
                        }
                    }
                }
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem {
                    Button(
                        action: { navigationCoordinator.routes.append(.postNewProduct) },
                        label: { Image(systemName: "plus") }
                    )
                }
            }
            .navigationDestination(for: HomeRoute.self) { route in
                switch route {
                case .postNewProduct:
                    PostProductView()
                case .productDetails(let product):
                    ProductDetailsView(product: product)
                        .environmentObject(navigationCoordinator)
                }
            }
        }
    }
}
