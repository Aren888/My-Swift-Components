//
//  SimpleSalesByWeekdayView.swift
//  Tong Ai
//
//  Created by Solicy Office on 19.04.24.
//

import SwiftUI
import Charts

struct SimpleSalesByWeekdayView: View {
    @ObservedObject var salesViewModel: ProgressViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            if let highestSellingWeekday = salesViewModel.highestSellingWeekday {
                Text("The most productive day of the week is ") +
                Text("\(longWeekday(for: highestSellingWeekday.number))").bold().foregroundColor(.black) +
                     Text(" with an average of ") +
                Text("\(Int(highestSellingWeekday.sales)) English phrases per day.").bold()
            }

            Chart(salesViewModel.averageSalesByWeekday, id: \.number) {
                    BarMark(x: .value("Day", weekday(for: $0.number)),
                            y: .value("Sales", $0.sales))
                
                    .opacity($0.number == salesViewModel.highestSellingWeekday?.number ? 1 : 0.3)
                
                
            }
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
            .frame(height: 50)
            .foregroundStyle(.black)
            
        }
       
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
    SimpleSalesByWeekdayView(salesViewModel: .preview)
        .padding()
}
