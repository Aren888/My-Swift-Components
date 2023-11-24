//
//  Expense.swift
//  CardScroll
//
//  Created by Solicy Ios on 23.11.23.
//

import SwiftUI

// MARK: - Expense Model

/// A model representing an expense with a unique identifier, amount spent, product description, and spend type.
struct Expense: Identifiable {
    var id: UUID = UUID()
    var amountSpent: String
    var product: String
    var spendType: String
}

// MARK: - Sample Expenses

/// An array containing sample expenses for testing and demonstration purposes.
var expenses: [Expense] = [
    Expense(amountSpent: "$482", product: "Amazon Purchase", spendType: "Groceries"),
    Expense(amountSpent: "$102", product: "Youtube Premium", spendType: "Streaming"),
    Expense(amountSpent: "$245", product: "Clothing Store", spendType: "Apparel"),
    Expense(amountSpent: "$89", product: "Coffee Shop", spendType: "Food & Drink"),
    Expense(amountSpent: "$357", product: "Gas Station", spendType: "Transportation"),
    Expense(amountSpent: "$590", product: "Movie Tickets", spendType: "Entertainment"),
    Expense(amountSpent: "$115", product: "Bookstore", spendType: "Books"),
    Expense(amountSpent: "$678", product: "Electronics Store", spendType: "Gadgets"),
    Expense(amountSpent: "$325", product: "Fitness Class", spendType: "Health"),
    Expense(amountSpent: "$480", product: "Home Decor", spendType: "Household"),
    Expense(amountSpent: "$218", product: "Fast Food", spendType: "Dining"),
    Expense(amountSpent: "$940", product: "Online Subscription", spendType: "Services"),
    Expense(amountSpent: "$322", product: "Pharmacy", spendType: "Healthcare"),
    Expense(amountSpent: "$755", product: "Concert Tickets", spendType: "Entertainment"),
    Expense(amountSpent: "$212", product: "Stationery", spendType: "Office Supplies"),
    Expense(amountSpent: "$928", product: "Home Improvement", spendType: "Household"),
    Expense(amountSpent: "$538", product: "Snack Bar", spendType: "Food & Drink"),
    Expense(amountSpent: "$1075", product: "Fashion Outlet", spendType: "Apparel"),
    Expense(amountSpent: "$632", product: "Car Wash", spendType: "Transportation"),
    Expense(amountSpent: "$198", product: "Mobile App Purchase", spendType: "Technology"),
    Expense(amountSpent: "$965", product: "Dinner Date", spendType: "Dining"),
    Expense(amountSpent: "$144", product: "Gift Shop", spendType: "Special Occasion")
]
