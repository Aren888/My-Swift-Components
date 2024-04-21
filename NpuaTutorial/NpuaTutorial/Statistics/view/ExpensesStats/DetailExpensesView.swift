//
//  DetailExpensesView.swift
//  Tong Ai
//
//  Created by Solicy Office on 19.04.24.
//

import SwiftUI

struct DetailExpensesView: View {
    
    @ObservedObject var expensesViewModel: ExpenseViewModel
    
    var body: some View {
        List {
            Group {
                Section {
                    ExpensesLineChartView(expensesViewModel: expensesViewModel)
                        .padding(.bottom)
                }
                
                Section {
                    Text("Detailed Breakdown of Your Statistic per Month")
                        .bold()
                        .padding(.top)
                    ExpensesDetailGridView(expensesViewModel: expensesViewModel)
                }
            }
            .listRowSeparator(.hidden)
            .listSectionSeparator(.visible)
            .listRowInsets(.init(top: 5, leading: 20, bottom: 5, trailing: 20))
        }
        .listStyle(.plain)
      
    }
}

#Preview {
    DetailExpensesView(expensesViewModel: .preview)
}
