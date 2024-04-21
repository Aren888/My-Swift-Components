//
//  SalesPerBookCategoryView.swift
//  Tong Ai
//
//  Created by Solicy Office on 19.04.24.
//

import SwiftUI

struct SalesPerBookCategoryView: View {
    
    enum ChartStyle: String, CaseIterable, Identifiable {
        case pie = "Pie Chart"
        case bar = "Bar Chart"
        case singleBar = "Single Bar"
      
        var id: Self { self }
    }
    
    @ObservedObject var salesViewModel: ProgressViewModel
    @State private var selectedChartStyle: ChartStyle = .pie
    
    var body: some View {
        VStack {
            Picker("Chart Type", selection: $selectedChartStyle) {
                ForEach(ChartStyle.allCases) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
           
            Spacer()
            SalesPerBookCategoryHeaderView(selectedChartStyle: selectedChartStyle,
                                           salesViewModel: salesViewModel)
            .font(.title3).padding(.vertical)
            switch selectedChartStyle {
                case .bar:
                    SalesPerBookCategoryBarChartView(salesViewModel: salesViewModel)
                case .pie:
                    if #available(macOS 14.0, *) {
                        SalesPerBookCategoryPieChartView(salesViewModel: salesViewModel)
                    } else {
                        Text("Pie charts only available for macOS 14 and iOS 17")
                    }
                case .singleBar:
                    SalesPerBookCategoryStackedBarChartView(salesViewModel: salesViewModel)
            }

            Spacer()
            Spacer()
        } .padding()
    }
}

#Preview {
    SalesPerBookCategoryView(salesViewModel: .preview)
}
