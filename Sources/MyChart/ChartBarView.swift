import SwiftUI
import Charts

public struct ChartBarView: View {
    
    var items: [ChartItem]
    var color: Color
    
    public init(_ items: [ChartItem], _ color: Color) {
        self.items = items
        self.color = color
    }
    
    public var body: some View {
        
        VStack {
            Chart {
                ForEach(items) { item in
                    BarMark(
                        x: .value("Name", item.name),
                        y: .value("Number", item.value)
                    )
                    .cornerRadius(4)
                    .foregroundStyle(color)
                }
                
               
            }
            .chartXAxis(content: {
                AxisMarks { value in
                    AxisValueLabel {
                        if let name = value.as(String.self) {
                            Text(name)
                                .rotationEffect(Angle(degrees: 60))

                        }
                    }

                }

            })
        }
        .padding()
    }
}
