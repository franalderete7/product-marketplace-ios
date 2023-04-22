//
//  LoginView.swift
//  Product Marketplace
//
//  Created by Francisco Alderete on 21/04/2023.
//
import Amplify
import SwiftUI
struct LoginView: View {
    // 1
    @State var username: String = ""
    @State var password: String = ""
    // 2
    @State var shouldShowSignUp: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                TextField("Username", text: $username)
                    .multilineTextAlignment(.center)
                SecureField("Password", text: $password)
                    .multilineTextAlignment(.center)
                Button("Log In") {
                    Task { await login() }
                }
                    .padding()
                    .padding(.horizontal)
                Spacer()
                Button("Don't have an account? Sign up.", action: { shouldShowSignUp = true })
                    .padding(.bottom, 20)
            }
            // 4
            .navigationDestination(isPresented: $shouldShowSignUp) {
                SignUpView(showLogin: { shouldShowSignUp = false })
                    .navigationBarBackButtonHidden(true)
            }
        }
    }

    func login() async {
        do {
            // 1
            let result = try await Amplify.Auth.signIn(
                username: username,
                password: password
            )
            switch result.nextStep {
            // 2
            case .done:
                print("login is done")
            default:
                print(result.nextStep)
            }
        } catch {
            print(error)
            print("cannot authenticate user")
        }
    }
}
