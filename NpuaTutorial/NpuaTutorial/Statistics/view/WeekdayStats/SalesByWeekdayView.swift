//
//  SalesByWeekdayView.swift
//  Tong Ai
//
//  Created by Solicy Office on 19.04.24.
//

import SwiftUI
import Charts

struct SalesByWeekdayView: View {
    
    @ObservedObject var salesViewModel: ProgressViewModel
    
    @State private var individualDaysAreShown: Bool = false
    @State private var medianSalesIsShown: Bool = true
    
    var showBestsellerHighlighted: Bool {
        !individualDaysAreShown && !medianSalesIsShown
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let highestSellingWeekday = salesViewModel.highestSellingWeekday {
                Text("The most productive day of the week is ") +
                Text("\(longWeekday(for: highestSellingWeekday.number))").bold().foregroundColor(.black) +
                     Text(" with an average of learning ") +
                Text("\(Int(highestSellingWeekday.sales)) English phrases per day.").bold()
            }


            Chart {
                ForEach(salesViewModel.averageSalesByWeekday, id: \.number) {
                    BarMark(x: .value("Day", weekday(for: $0.number)),
                            y: .value("Sales", $0.sales))
                    .foregroundStyle(.gray.opacity(0.2))
                    
                    RectangleMark(x: .value("Day", weekday(for: $0.number)),
                                  y: .value("Sales", $0.sales),
                                  height: 2)
                    .foregroundStyle(.gray)
                }

                if medianSalesIsShown {
                    let median = salesViewModel.medianSales
                    RuleMark(
                        y: .value("Median", median)
                    )
                    .foregroundStyle(Color.black)
                    .lineStyle(StrokeStyle(lineWidth: 3))
                    .annotation(position: .top, alignment: .trailing) {
                        Text("Median: \(String(format: "%.2f", median))")
                            .font(.body.bold())
                            .foregroundStyle(.black)
                    }
                }
            }
            .aspectRatio(1, contentMode: .fit)
            
            Toggle(medianSalesIsShown ? "Show median" : "Hide median", isOn: $medianSalesIsShown)

            Spacer()
        }
        .padding()
    }
    
    let formatter = DateFormatter()
    
    func weekday(for number: Int) -> String {
        formatter.shortWeekdaySymbols[number - 1]
    }
    
    func longWeekday(for number: Int) -> String {
        formatter.weekdaySymbols[number - 1]
    }
}

#Preview {
    SalesByWeekdayView(salesViewModel: .preview)
}
