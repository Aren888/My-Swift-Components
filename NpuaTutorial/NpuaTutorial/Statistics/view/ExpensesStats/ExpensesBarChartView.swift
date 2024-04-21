//
//  ExpensesBarChartView.swift
//  Tong Ai
//
//  Created by Solicy Office on 19.04.24.
//

import SwiftUI
import Charts

struct ExpensesBarChartView: View {
    
    @ObservedObject var expensesViewModel: ExpenseViewModel
    var body: some View {
        Chart {
            ForEach(expensesViewModel.monthlyFixedExpensesData, id: \.month) { expenseData in
                BarMark(x: .value("Month", month(for: expenseData.month)),
                        y: .value("Expense", expenseData.amount))
            }
            .foregroundStyle(by: .value("Expense", "Learned"))
            .symbol(by: .value("Expense", "Learned"))
            .position(by: .value("Expenses", "Learned"))
            
            ForEach(expensesViewModel.monthlyVariableExpensesData, id: \.month) { expenseData in
                BarMark(x: .value("Date", month(for: expenseData.month)),
                        y: .value("Expense", expenseData.amount))
            }
            .foregroundStyle(by: .value("Expense", "UnLearned"))
            .symbol(by: .value("Expense", "UnLearned"))
            .position(by: .value("Expenses", "UnLearned"))
            
        }
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
    
    let formatter = DateFormatter()
    
    func month(for number: Int) -> String {
        // to short - charts cannot uniquely identify
        // formatter.veryShortMonthSymbols[number - 1]
        formatter.shortStandaloneMonthSymbols[number - 1]
    }
    
}

#Preview {
    ExpensesBarChartView(expensesViewModel: .preview)
}
