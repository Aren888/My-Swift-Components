//
//  SimpleBookSalesView.swift
//  Tong Ai
//
//  Created by Solicy Office on 19.04.24.
//

import SwiftUI
import Charts

struct SimpleBookSalesView: View {
    
    @ObservedObject var salesViewModel: ProgressViewModel
    var body: some View {
        VStack(alignment: .leading) {
            if let changedProgress = changedLanguageProgress() {
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName: isPositiveChange ? "arrow.up.right" : "arrow.down.right")
                        .bold()
                        .foregroundColor(isPositiveChange ? .green : .red)
                    
                    Text("You've already made ") +
                        Text(changedProgress)
                            .bold() +
                        Text(" progress in learning, over the last 90 days.")
                }
            }
            
            Chart(salesViewModel.salesByWeek, id: \.day) {
                BarMark(
                    x: .value("Week", $0.day, unit: .weekOfYear),
                    y: .value("Sales", $0.sales)
                )
            }
            .frame(height: 70)
            .chartYAxis(.hidden)
            .chartXAxis(.hidden)
            .foregroundStyle(.black.gradient)
        }
    }
    
    func changedLanguageProgress() -> String? {
        let percentage = percentage
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        
        
        guard let formattedPercentage = numberFormatter.string(from: NSNumber(value: percentage)) else {
            return nil
        }
        
        let changedDescription = percentage < 0 ? "less " : "more "
        
        return changedDescription + formattedPercentage
    }
    
    var percentage: Double {
        Double(salesViewModel.totalSales) / Double(salesViewModel.lastTotalSales) - 1
    }
    
    var isPositiveChange: Bool {
        percentage > 0
    }
    
    //
}

#Preview {
    
    let increasedVM = ProgressViewModel.preview
    let decreasedVM = ProgressViewModel.preview
    decreasedVM.lastTotalSales = 24500
    
    return VStack(spacing: 60) {
        SimpleBookSalesView(salesViewModel: increasedVM)
          
        
        SimpleBookSalesView(salesViewModel: decreasedVM)
    }
    .padding()
}
