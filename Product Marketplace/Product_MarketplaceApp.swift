//
//  Product_MarketplaceApp.swift
//  Product Marketplace
//
//  Created by Francisco Alderete on 21/04/2023.
//
import Amplify
import AWSCognitoAuthPlugin
import AWSDataStorePlugin
import SwiftUI


@main
struct Product_MarketplaceApp: App {
    init() {
        configureAmplify()
    }
    var body: some Scene {
        WindowGroup {
            SessionView()
        }
    }
    
    func configureAmplify() {
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            let models = AmplifyModels()
            try Amplify.add(plugin: AWSDataStorePlugin(modelRegistration: models))
            try Amplify.configure()
            print("Successfully configured Amplify")
        } catch {
            print("Failed to initialize Amplify", error)
        }
    }
}

    
