//
//  TodoList.swift
//  TodoList
//
//  Created by Solicy Ios on 20.02.24.
//

import WidgetKit
import SwiftUI
import SwiftData
import AppIntents

// MARK: - Provider

struct Provider: AppIntentTimelineProvider {

    // MARK: Placeholder

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    // MARK: Snapshot

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    // MARK: Timeline

    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            _ = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: .now)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

// MARK: - SimpleEntry

struct SimpleEntry: TimelineEntry {
    let date: Date
}

// MARK: - TodoListEntryView

struct TodoListEntryView : View {
    var entry: Provider.Entry

    // MARK: Query

    @Query(todoDescriptor, animation: .snappy) private var activeList: [Todo]

    var body: some View {
        VStack {
            ForEach(activeList) { todo in
                HStack(spacing: 10) {
                    // MARK: Button

                    Button(intent: ToggleButton(id: todo.taskID)) {
                        Image(systemName: "circle")
                    }
                    .font(.callout)
                    .tint(todo.priority.color.gradient)
                    .buttonBorderShape(.circle)

                    // MARK: Text

                    Text(todo.task)
                        .font(.callout)
                        .lineLimit(1)

                    Spacer(minLength: 0)
                }
                .transition(.push(from: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .overlay {
            if activeList.isEmpty {
                // MARK: No Tasks Text

                Text("No Tasks")
                    .transition(.push(from: .bottom))
            }
        }
    }

    // MARK: Todo Descriptor

    static var todoDescriptor: FetchDescriptor<Todo> {
        let predicate = #Predicate<Todo> { !$0.isCompleted }
        let sort = [SortDescriptor(\Todo.lastUpdated, order: .reverse)]
        var descriptor = FetchDescriptor(predicate: predicate, sortBy: sort)

        descriptor.fetchLimit = 3
        return descriptor
    }
}

// MARK: - TodoList Widget

struct TodoList: Widget {
    let kind: String = "Todo List"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            TodoListEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
                .modelContainer(for: Todo.self)
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Tasks")
        .description("This is a Todo List")
    }
}

// MARK: - ConfigurationAppIntent Extension

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }

    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

// MARK: - Preview

#Preview(as: .systemSmall) {
    TodoList()
} timeline: {
    SimpleEntry(date: .now)
}

// MARK: - ToggleButton

struct ToggleButton: AppIntent {

    // MARK: Title

    static var title: LocalizedStringResource = .init(stringLiteral: "Toggle's Todo State")

    // MARK: Parameter

    @Parameter(title: "Todo ID")
    var id: String

    // MARK: Initialization

    init() {
        
    }

    init(id: String) {
        self.id = id
    }

    // MARK: Perform

    func perform() async throws -> some IntentResult {
        let context = try ModelContext(.init(for: Todo.self))
        
        let descriptor = FetchDescriptor(predicate: #Predicate<Todo> { $0.taskID == id })

        if let todo = try context.fetch(descriptor).first {
            todo.isCompleted = true
            todo.lastUpdated = .now

            try context.save()
        }
        return .result()
    }
}
