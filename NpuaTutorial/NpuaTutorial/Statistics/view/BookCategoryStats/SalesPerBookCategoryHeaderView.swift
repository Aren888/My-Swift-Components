//
//  SalesPerBookCategoryHeaderView.swift
//  Tong Ai
//
//  Created by Solicy Office on 19.04.24.
//

import SwiftUI

struct SalesPerBookCategoryHeaderView: View {
    
    let selectedChartStyle: SalesPerBookCategoryView.ChartStyle
    @ObservedObject var salesViewModel: ProgressViewModel
    
    var body: some View {
        
        if let bestSellingCategory = salesViewModel.bestSellingCategory,
           let bestsellingCategoryPercentage  {
            Text("Your favorite category is ") + Text("\(bestSellingCategory.category.displayName)").bold().foregroundColor(.black) +
            Text(" with ") +
            Text("\(bestsellingCategoryPercentage)").bold() +
            Text(" engagement in the last 90 days")
        }
    }
    
    var bestsellingCategoryPercentage: String? {
        guard let bestSellingCategory = salesViewModel.bestSellingCategory else { return nil }
        
        let percentage = Double(bestSellingCategory.sales) / Double(salesViewModel.totalSales)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        
        guard let formattedPercentage = numberFormatter.string(from: NSNumber(value: percentage)) else {
            return nil
        }
        
        return formattedPercentage
    }
}

#Preview {
    let vm = ProgressViewModel.preview
    return VStack {
        SalesPerBookCategoryHeaderView(selectedChartStyle: .bar, salesViewModel: vm)
        SalesPerBookCategoryHeaderView(selectedChartStyle: .singleBar, salesViewModel: vm)
    }
}
