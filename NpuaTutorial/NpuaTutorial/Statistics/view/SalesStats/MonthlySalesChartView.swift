//
//  MonthlySalesChartView.swift
//  Tong Ai
//
//  Created by Solicy Office on 19.04.24.
//

import SwiftUI
import Charts

struct CalculatedMonthlySalesChartView: View {
    @ObservedObject var salesViewModel: ProgressViewModel
    var body: some View {
        Chart(salesViewModel.salesByMonth, id: \.day) {
            BarMark(
                x: .value("Month", $0.day, unit: .month),
                y: .value("Sales", $0.sales)
            )
            .foregroundStyle(.black)
        }
    }
}

// you can simple give all data to the chart
// tell it to use a unit of month
// and it automically collects all data points for each month

struct MonthlySalesChartView: View {
    
    @ObservedObject var salesViewModel: ProgressViewModel
    
    var body: some View {
        Chart(salesViewModel.salesData) {
            BarMark(
                x: .value("Month", $0.saleDate, unit: .month),
                y: .value("Sales", $0.quantity)
            )
        }
        .foregroundStyle(.black)


        .chartXAxis {
            AxisMarks(values: .stride(by: .month)) { _ in
                AxisGridLine()
                AxisTick()
                AxisValueLabel(format: .dateTime.month(.abbreviated), centered: true)
            }
        }
    }
}

#Preview {
    VStack{
        MonthlySalesChartView(salesViewModel: .preview)
            .aspectRatio(1, contentMode: .fit)
        
        CalculatedMonthlySalesChartView(salesViewModel: .preview)
    }
        .padding()
}
