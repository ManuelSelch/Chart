import SwiftUI
import Charts

public struct ChartPieView: View {
    let items: [ChartItem]
    
    public init(_ items: [ChartItem]){
        self.items = items
    }
    
    var itemsOrdered:  [ChartItem] {
        var t = items
        t.sort { $0.value > $1.value }
        return t
    }
    
    public var body: some View {
        VStack {
            Chart(itemsOrdered, id: \.id) { item in
                SectorMark(
                    angle: .value("", item.value)
                )
                .foregroundStyle(by: .value("", item.name))
            
            }
            .padding()
            .frame(height: 200)
        }
    }
}
