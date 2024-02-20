//
//  AppIntent.swift
//  TodoList
//
//  Created by Solicy Ios on 20.02.24.
//

import WidgetKit
import AppIntents

// MARK: - ConfigurationAppIntent

struct ConfigurationAppIntent: WidgetConfigurationIntent {

    // MARK: Title and Description

    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is a Todo List widget.")

    // MARK: Configurable Parameter

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}
