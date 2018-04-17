import Service

/// The base type used to store arbitrary data
/// in a single request.
/// This type works with a request's `privateContainer`
/// to hold the data.
public class Storage: Service {
    
    /// The underlying dictionary that holds everything.
    public var cache: [String: Any] = [:]
    
    ///
    public init() {}
}
