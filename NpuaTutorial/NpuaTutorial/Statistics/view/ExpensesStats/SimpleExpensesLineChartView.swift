//
//  SimpleExpensesLineChartView.swift
//  Tong Ai
//
//  Created by Solicy Office on 19.04.24.
//

import SwiftUI
import Charts

struct SimpleExpensesLineChartView: View {
    
    @ObservedObject var expensesViewModel: ExpenseViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Your total study of over the past year amounts to ") +
            Text("\(Int(expensesViewModel.totalExpenses))")
                .bold()
                .foregroundColor(Color.black) +
            Text(" Words.")
                
            
            
            Chart {
                Plot {
                    ForEach(expensesViewModel.monthlyExpensesData) { expenseData in
                        AreaMark(x: .value("Date", expenseData.month),
                                 y: .value("Expense", expenseData.totalExpenses))
                    }
                }
                .interpolationMethod(.linear)
                .foregroundStyle(.black)
            }
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
            .chartLegend(.hidden)
            .chartXScale(domain: 1...12)
            
            .frame(height: 70)
        }
    }
    
    let formatter = DateFormatter()
    
    func month(for number: Int) -> String {
        formatter.shortStandaloneMonthSymbols[number - 1]
    }
    
}


#Preview {
    SimpleExpensesLineChartView(expensesViewModel: .preview)
        .padding(.horizontal)
}
