//
//  PostProductView.swift
//  Product Marketplace
//
//  Created by Francisco Alderete on 23/04/2023.
//

import SwiftUI
struct PostProductView: View {

    @State var name: String = ""
    @State var price: String = ""
    @State var description: String = ""
    @State var image: UIImage?
    @State var shouldShowImagePicker: Bool = false
    @State var postButtonIsDisabled: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Button(action: { shouldShowImagePicker = true }) {
                    SelectImageView()
                }
                TextField("Name", text: $name)
                TextField("Price", text: $price)
                    .keyboardType(.numberPad)
                TextField("Description", text: $description, axis: .vertical)
                    .lineLimit(1...3)
                
                Button("Post", action: {})
                    .disabled(postButtonIsDisabled)
            }
        }
        .padding(.horizontal)
        .navigationTitle("New Product")
        .sheet(isPresented: $shouldShowImagePicker) {
            ImagePickerView(image: $image)
        }
    }
    

    @ViewBuilder
    func SelectImageView() -> some View {
        if let image = self.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 250)
                .clipped()
        } else {
            Image(systemName: "photo.on.rectangle.angled")
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 250)
        }
    }
}
