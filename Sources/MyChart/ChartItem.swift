import Foundation

public struct ChartItem: Identifiable {
    public var id: Int
    public var name: String
    public var value: Double
    
    public init(id: Int, name: String, value: Double) {
        self.id = id
        self.name = name
        self.value = value
    }
}
