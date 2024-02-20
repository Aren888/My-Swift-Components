//
//  TodoRowView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 19.02.24.
//

import SwiftUI
import WidgetKit

struct TodoRowView: View {
    
    // MARK: - Properties
    
    @Bindable var todo: Todo
    @FocusState private var isActive: Bool
    @Environment(\.modelContext) private var context
    @Environment(\.scenePhase) private var phase
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 8) {
            // Checkmark Button
            if !isActive && !todo.task.isEmpty {
                Button(action: {
                    todo.isCompleted.toggle()
                    todo.lastUpdated = .now
                    WidgetCenter.shared.reloadAllTimelines()
                }, label: {
                    Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                        .font(.title2)
                        .padding(3)
                        .contentShape(.rect)
                        .foregroundStyle(todo.isCompleted ? .gray : .accentColor)
                        .contentTransition(.symbolEffect(.replace))
                })
            }
            
            // Task TextField
            TextField("Record Video", text: $todo.task)
                .strikethrough(todo.isCompleted)
                .foregroundStyle(todo.isCompleted ? .gray : .primary)
                .focused($isActive)
            
            // Priority Menu
            if !isActive && !todo.task.isEmpty {
                Menu {
                    ForEach(Priority.allCases, id: \.rawValue) { priority in
                        Button(action: { todo.priority = priority }, label: {
                            HStack {
                                Text(priority.rawValue)
                                if todo.priority == priority { Image(systemName: "checkmark") }
                            }
                        })
                    }
                } label: {
                    Image(systemName: "circle.fill")
                        .font(.title2)
                        .padding(3)
                        .contentShape(.rect)
                        .foregroundStyle(todo.priority.color.gradient)
                }
            }
        }
        .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
        .animation(.snappy, value: isActive)
        .onAppear {
            isActive = todo.task.isEmpty
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
            // Delete Button
            Button("", systemImage: "trash") {
                context.delete(todo)
                WidgetCenter.shared.reloadAllTimelines()
            }
            .tint(.red)
        }
        .onSubmit(of: .text) {
            if todo.task.isEmpty {
                context.delete(todo)
                WidgetCenter.shared.reloadAllTimelines()
            }
        }
        .onChange(of: phase) { _, newValue in
            if newValue != .active && todo.task.isEmpty {
                context.delete(todo)
                WidgetCenter.shared.reloadAllTimelines()
            }
        }
        .task {
            todo.isCompleted = todo.isCompleted
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        TodoView()
    }
}
