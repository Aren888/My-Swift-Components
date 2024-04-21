//
//  DetailBookSalesView.swift
//  Tong Ai
//
//  Created by Solicy Office on 19.04.24.
//

import SwiftUI
import Charts

struct DetailBookSalesView: View {
    
    enum TimeInterval: String, CaseIterable, Identifiable {
        case day = "Day"
        case week = "Week"
        case month = "Month"
        var id: Self { self }
    }
    @ObservedObject var salesViewModel: ProgressViewModel = .preview
    @State private var selectedTimeInterval = TimeInterval.day
    
    var body: some View {
        VStack(alignment: .leading) {
            Picker(selection: $selectedTimeInterval.animation()) {
                ForEach(TimeInterval.allCases) { interval in
                    Text(interval.rawValue)
                }
            } label: {
                Text("Time interval")
            }
            .pickerStyle(.segmented)
            
            Group {
                Text("You've already learned ") +
                Text("\(salesViewModel.totalSales) English phrases").bold().foregroundColor(Color.accentColor) +
                Text(" in the last 90 days.")
            }.padding(.vertical)
            
            Group {
                switch selectedTimeInterval {
                    case .day:
                        if #available(macOS 14.0, *) {
                            DailySalesChartView(salesData: salesViewModel.salesData)
                        } else {
                            Text("scrollable charts only available for macOS 14 and iOS 17")
                        }
                    case .week:
                        if #available(macOS 14.0, *) {
                            WeeklySalesChartView(salesViewModel: salesViewModel)
                        } else {
                            Text("selection in charts only available for macOS 14 and iOS 17")
                        }
                        
                    case .month:
                        MonthlySalesChartView(salesViewModel: salesViewModel)
                }
            }
            .aspectRatio(0.8, contentMode: .fit)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    DetailBookSalesView(salesViewModel: .preview)
}
