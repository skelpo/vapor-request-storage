import Service

public class Storage: Service {
    public var cache: [String: Codable] = [:]
    
    public init() {}
}
