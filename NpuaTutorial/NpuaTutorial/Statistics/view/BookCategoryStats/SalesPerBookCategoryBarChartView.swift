//
//  SalesPerBookCategoryBarChartView.swift
//  Tong Ai
//
//  Created by Solicy Office on 19.04.24.
//

import SwiftUI
import Charts

struct SalesPerBookCategoryBarChartView: View {
    
    @ObservedObject var salesViewModel: ProgressViewModel
    
    var body: some View {
        Chart(salesViewModel.totalSalesPerCategory, id: \.category) { data in
            BarMark(x: .value("Phrases", data.sales),
                    y: .value("Category", data.category.displayName))
            
            .annotation(position: .trailing, alignment: .leading, content: {
                Text(String(data.sales))
                    .opacity(data.category == salesViewModel.bestSellingCategory?.category ? 1 : 0.3)
            })
            
            .foregroundStyle(by: .value("Name", data.category.displayName))
            .opacity(data.category == salesViewModel.bestSellingCategory?.category ? 1 : 0.3)
        }
        .chartLegend(.hidden)
        .frame(maxHeight: 400)
    }
}

#Preview {
    SalesPerBookCategoryBarChartView(salesViewModel: .preview)
        .padding()
}
