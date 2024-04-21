//
//  ExpensesDetailGridView.swift
//  Tong Ai
//
//  Created by Solicy Office on 19.04.24.
//

import SwiftUI

struct ExpensesDetailGridView: View {
    
    @ObservedObject var expensesViewModel: ExpenseViewModel
    
    var body: some View {
        
        
        Grid(alignment: .trailing, horizontalSpacing: 15, verticalSpacing: 10) {
            GridRow {
                Color.clear
                    .gridCellUnsizedAxes([.vertical, .horizontal])
                Text("Learned")
                    .gridCellAnchor(.center)
                Text("UnLearned")
                Text("All")
                    .bold()
                    .gridCellAnchor(.center)
            }
            
           Divider()
            .gridCellUnsizedAxes([.vertical, .horizontal])
            
            ForEach(expensesViewModel.monthlyExpensesData) { data in
                GridRow {
                    Text(month(for: data.month))
                    Text("\(Int(data.fixedExpenses))")
                    Text("\(Int(data.variableExpenses))")
                    Text("\(Int(data.totalExpenses))")
                        .bold()
                    
                    
                }
                .gridCellAnchor(.center)
                Divider()
                
            }
            
            VStack {
                HStack {
                    Text("Total")
                        .bold()
                    
                    Spacer()
                    
                    Text("\(Int(expensesViewModel.totalExpenses)) Words.")
                        .bold()
                        .foregroundStyle(.pink)
                        .fixedSize()
                    
                    
                    
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
        }
        .padding(.horizontal, 14)
    }
    
    let formatter = DateFormatter()
    
    func month(for number: Int) -> String {
        formatter.shortMonthSymbols[number - 1]
    }
}

#Preview {
    ExpensesDetailGridView(expensesViewModel: .preview)
}
