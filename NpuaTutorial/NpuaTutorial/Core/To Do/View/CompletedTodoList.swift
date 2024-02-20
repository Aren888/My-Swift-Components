//
//  CompletedTodoList.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 19.02.24.
//

import SwiftUI
import SwiftData

struct CompletedTodoList: View {
    
    // MARK: - Properties
    
    @Binding var showAll: Bool
    @Query private var completedList: [Todo]
    
    // MARK: - Initialization
    
    init(showAll: Binding<Bool>) {
        let predicate = #Predicate<Todo> { $0.isCompleted }
        let sort = [SortDescriptor(\Todo.lastUpdated, order: .reverse)]
        var descriptor = FetchDescriptor(predicate: predicate, sortBy: sort)
        
        if !showAll.wrappedValue {
            descriptor.fetchLimit = 4
        }
        
        _completedList = Query(descriptor, animation: .snappy)
        _showAll = showAll
    }
    
    // MARK: - Body
    
    var body: some View {
        Section {
            ForEach(completedList) { todo in
                TodoRowView(todo: todo)
            }
        } header: {
            HStack {
                Text("Completed")
                
                Spacer(minLength: 0)
                
                if showAll && !completedList.isEmpty {
                    Button("Show Recents") {
                        showAll = false
                    }
                }
            }
            .font(.caption)
        } footer: {
            if completedList.count == 4 && !showAll && !completedList.isEmpty {
                HStack {
                    Text("Showing Recent 4 Tasks")
                        .foregroundStyle(.gray)
                    
                    Spacer(minLength: 0)
                    
                    Button("Show All") {
                        showAll = true
                    }
                }
                .font(.caption)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        TodoView()
    }
}
