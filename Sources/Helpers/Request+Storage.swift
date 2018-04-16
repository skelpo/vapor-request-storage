import Vapor

extension Request {
    public func get(_ key: String)throws -> Codable? {
        let storage = try self.privateContainer.make(Storage.self)
        return storage.cache[key]
    }
    
    public func set(_ key: String, to value: Codable)throws {
        let storage = try self.privateContainer.make(Storage.self)
        storage.cache[key] = value
    }
}
