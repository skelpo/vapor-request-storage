import Vapor

public class Provider: Vapor.Provider {
    public static var repositoryName: String = "VaporRequestStorage"
    
    public init () {}
    
    public func register(_ services: inout Services) throws {
        services.register() { (container) -> (Storage) in
            return Storage()
        }
    }
    
    public func boot(_ worker: Container) throws {}
    
    public func didBoot(_ worker: Container) throws -> EventLoopFuture<Void> { return Future.map(on: worker) {()} }
}
