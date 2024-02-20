//
//  TodoListBundle.swift
//  TodoList
//
//  Created by Solicy Ios on 20.02.24.
//

import WidgetKit
import SwiftUI

@main
struct TodoListBundle: WidgetBundle {
    var body: some Widget {
        TodoList()
        TodoListLiveActivity()
    }
}
