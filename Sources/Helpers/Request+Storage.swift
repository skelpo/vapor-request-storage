import Vapor

extension Request {
    
    /// Gets a value stored in the request's private `Storage` service
    /// and converts it to the specefied type. This method works similarly
    /// to a dictionary's `subscript` method. If no value exists for the key
    /// passed in, `nil` is returned. If type conversion fails, the we throw
    ///
    /// - Parameters:
    ///   - key: The storage key of the value to fetch.
    ///   - stored: The type to cast the value to before returning it.
    /// - Returns: The value fetched from the private container,
    ///   converted to the desired type.
    /// - Throws: Errors when getting the `Storage` service from
    ///   the request's private container or failed type conversion of the value.
    public func get<Stored>(_ key: String, as stored: Stored.Type = Stored.self)throws -> Stored? {
        let storage = try self.privateContainer.make(Storage.self)
        
        guard let found = storage.cache[key] else { return nil }
        if found == nil { return nil }
        
        guard let value = found as? Stored else {
            throw Abort(.internalServerError, reason: "Unable to get value for key '\(key)' as type \(String(describing: stored))")
        }
        
        return value
    }
    
    /// Sets the value of a key in the request's private storage service.
    /// This works the same way as `[key] = value` syntax does for a dictionary,
    ///
    /// - Parameters:
    ///   - key: A string used to identify and access the value later.
    ///   - value: The value to store with the given key.
    /// - Throws: Errors when getting the `Storage` service from
    ///   the request's private container.
    public func set(_ key: String, to value: Any?)throws {
        let storage = try self.privateContainer.make(Storage.self)
        storage.cache[key] = value
    }
    
    /// Gets the `Storage` instance from the
    /// request's private container.
    ///
    /// - Returns: The request's private `Storage` instance.
    public func storage()throws -> Storage {
        return try self.privateContainer.make(Storage.self)
    }
}
