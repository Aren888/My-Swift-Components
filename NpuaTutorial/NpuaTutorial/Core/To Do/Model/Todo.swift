//
//  Todo.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 07.02.24.
//

import SwiftUI
import SwiftData

@Model
class Todo {
    
    // MARK: - Properties
    
    private(set) var taskID = UUID().uuidString
    var task: String
    var isCompleted: Bool = false
    var priority: Priority
    var lastUpdated: Date = Date.now
    
    // MARK: - Initialization
    
    init(task: String, priority: Priority) {
        self.task = task
        self.priority = priority
    }
}

// MARK: - Priority Enum

enum Priority: String, Codable, CaseIterable {
    case normal = "Normal"
    case medium = "Medium"
    case high = "High"
    
    var color: Color {
        switch self {
        case .normal: return .green
        case .medium: return .yellow
        case .high: return .red
        }
    }
}
