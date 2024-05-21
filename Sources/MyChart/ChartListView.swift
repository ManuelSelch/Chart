import SwiftUI

public struct ChartListView: View {
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
        List(itemsOrdered){ item in
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

