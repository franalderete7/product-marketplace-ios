// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "11a7eb840fddeb4a233287fce0bc55a5"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: ChatRoom.self)
    ModelRegistry.register(modelType: Message.self)
    ModelRegistry.register(modelType: Product.self)
    ModelRegistry.register(modelType: User.self)
  }
}