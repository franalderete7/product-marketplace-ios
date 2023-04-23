// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "314569ce4638780a2da0b20ddddd5ced"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Product.self)
    ModelRegistry.register(modelType: User.self)
  }
}