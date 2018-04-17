import Vapor

/// Used to register the `Storage` service with a `Services` instance.
///
///     try service.register(StorageProvider())
public class StorageProvider: Vapor.Provider {
    
    /// See `Provider.repositoryName`.
    public static var repositoryName: String = "VaporRequestStorage"
    
    /// We add this because the synthesized initializer is defined as `private`.
    public init () {}
    
    /// See `Provider.register`.
    public func register(_ services: inout Services) throws {
        services.register() { (container) -> (Storage) in
            return Storage()
        }
    }
    
    /// See `Provider.boot`.
    public func boot(_ worker: Container) throws {}
    
    /// See `Provider.didBoot`.
    public func didBoot(_ worker: Container) throws -> EventLoopFuture<Void> { return Future.map(on: worker) {()} }
}
