import SwiftUI
import Charts

public struct ChartItem {
    public var id: Int
    public var name: String
    public var value: Double
    
    public init(id: Int, name: String, value: Double) {
        self.id = id
        self.name = name
        self.value = value
    }
}

public struct ChartView: View {
    let items: [ChartItem]
    let formatter: DateComponentsFormatter
    
    var itemClicked: (_ id: Int) -> ()
    
    public init(_ items: [ChartItem], _ itemClicked: @escaping (_ id: Int ) -> ()){
        self.items = items
        self.itemClicked = itemClicked
        
        formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
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
   
            List(itemsOrdered, id: \.id){ item in
                let valueStr = formatter.string(from: item.value) ?? "--"
                Button(action: {
                    itemClicked(item.id)
                }){
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text(valueStr)
                    }
                }
            }
             
        }
    }
}