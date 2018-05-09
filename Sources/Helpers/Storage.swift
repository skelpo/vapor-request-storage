import Service

/// The base type used to store arbitrary data
/// in a single request.
/// This type works with a request's `privateContainer`
/// to hold the data.
public class Storage: Service {
    
    /// The underlying dictionary that holds everything.
    public var cache: [String: Any?] = [:]
    
    ///
    public init() {}
    
    /// Allows accessing stored values with
    /// `storage[key]` syntax.
    ///
    /// - Parameter key: The key of the value to fetch.
    ///
    /// - Returns: The value stored for the key passed in.
    public subscript (_ key: String) -> Any? {
        get {
            return self.cache[key] ?? nil
        }
        set {
            self.cache[key] = newValue
        }
    }
    
    /// Allows accessing stored values with
    /// `storage[key]` syntax as a specific type.
    ///
    /// - Parameters:
    ///   - key: The key of the value to fetch.
    ///   - type: The type to convert the stored value to.
    ///
    /// - Returns: The value stored for the key passed in.
    public subscript <T>(_ key: String, as type: T.Type) -> T? {
        get {
            let value = self.cache[key] ?? nil
            return value as? T
        }
        set {
            self.cache[key] = newValue
        }
    }
    
    /// Allows accessing stored values with
    /// `storage[key]` syntax as a specific type.
    ///
    /// - Parameters:
    ///   - key: The key of the value to fetch.
    ///
    /// - Returns: The value stored for the key passed in.
    public subscript <T>(_ key: String) -> T? {
        get {
            let value = self.cache[key] ?? nil
            return value as? T
        }
        set {
            self.cache[key] = newValue
        }
    }
}
