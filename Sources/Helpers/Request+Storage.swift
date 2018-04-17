import Vapor

extension Request {
    public func get<Stored>(_ key: String, as stored: Stored.Type = Stored.self)throws -> Stored? {
        let storage = try self.privateContainer.make(Storage.self)
        guard let found = storage.cache[key] else { return nil }
        guard let value = found as? Stored else {
            throw Abort(.internalServerError, reason: "Unable to get value for key '\(key)' as type \(String(describing: stored))")
        }
        return value
    }
    
    public func set(_ key: String, to value: Any)throws {
        let storage = try self.privateContainer.make(Storage.self)
        storage.cache[key] = value
    }
}
