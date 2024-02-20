//
//  TodoView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 07.02.24.
//

import SwiftUI
import SwiftData

struct TodoView: View {

    // MARK: - Properties

    @Query(
        filter: #Predicate<Todo> { !$0.isCompleted },
        sort: [SortDescriptor(\Todo.lastUpdated, order: .reverse)],
        animation: .snappy
    ) private var activeList: [Todo]

    @Environment(\.modelContext) private var context
    @State private var showAll: Bool = false

    // MARK: - Body

    var body: some View {
        NavigationView {
            List {
                Section(activeSectionTitle) {
                    ForEach(activeList) { todo in
                        TodoRowView(todo: todo)
                    }
                }
                CompletedTodoList(showAll: $showAll)
            }
            .padding(.bottom, 30)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        let todo = Todo(task: "", priority: .normal)
                        context.insert(todo)
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .frame(width: UIScreen.main.bounds.width / 1.1, height: 40, alignment: .center)
                            Text("Add Todo")
                                .tint(.white)
                        }
                    })
                    .tint(.black)
                    .padding(.bottom, 30)
                }
            }
            .clipped()
        }
    }

    // MARK: - Computed Properties

    private var activeSectionTitle: String {
        let count = activeList.count
        return count == 0 ? "Active" : "Active (\(count))"
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        TodoView()
    }
}
