//
//  StatisticView.swift
//  Tong Ai
//
//  Created by Solicy Office on 19.04.24.
//

import SwiftUI

struct StatisticView: View {
    @StateObject var salesViewModel: ProgressViewModel = .preview
    @StateObject var expensesViewModel: ExpenseViewModel = .preview
    
    var body: some View {
        
            List {
                Section {
                    NavigationLink {
                        DetailBookSalesView(salesViewModel: salesViewModel)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        SimpleBookSalesView(salesViewModel: salesViewModel)
                    }
                }

                Section {
                    NavigationLink {
                    SalesByWeekdayView(salesViewModel: salesViewModel)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        SimpleSalesByWeekdayView(salesViewModel: salesViewModel)
                    }
                }
                
                Section {
                    NavigationLink {
                        SalesPerBookCategoryView(salesViewModel: salesViewModel)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                       
                        SimpleSalesPerBookCategoryPieChartView(salesViewModel: salesViewModel)
                    }
                }
                
                Section {
                    NavigationLink {
                        DetailExpensesView(expensesViewModel: expensesViewModel)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                       SimpleExpensesLineChartView(expensesViewModel: expensesViewModel)
                    }
                }
        }
    }
}

#Preview {
    NavigationStack {
        StatisticView()
    }
}
