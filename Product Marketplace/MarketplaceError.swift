//
//  MarketplaceError.swift
//  Product Marketplace
//
//  Created by Francisco Alderete on 21/04/2023.
//

import Amplify
import Foundation
enum MarketplaceError: Error {
    case amplify(AmplifyError)
}
