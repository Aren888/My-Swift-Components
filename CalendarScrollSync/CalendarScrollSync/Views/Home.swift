//
//  Home.swift
//  CalendarScrollSync
//
//  Created by Solicy Ios on 23.11.23.
//

import SwiftUI

struct Home: View {
    
    // MARK: - State Variables
    
    @State private var selectedMonth: Date = .currentMonth
    @State private var selectedDate: Date = .now
    
    // MARK: - Constants
    
    var calendarTitleViewHeight: CGFloat { return 75.0 }
    var weekLabelHeight: CGFloat { return 30.0 }
    var calendarGridHeight: CGFloat { return CGFloat((selectedMonthDates.count / 7) * 60) }
    
    var horizontalPadding: CGFloat { return 15.0 }
    var topPadding: CGFloat { return 15.0 }
    var bottomPadding: CGFloat { return 5.0 }
    
    var safeArea: EdgeInsets
    
    // MARK: - Body
    var body: some View {
        let maxHeight = calendarHeight - (calendarTitleViewHeight + weekLabelHeight + safeArea.top + 50 + topPadding + bottomPadding - 50)
        ScrollView(.vertical) {
            VStack(spacing: 0) {
                CalendarView() // TODO: Extract CalendarView as a separate view for better readability.
                VStack(spacing: 15) {
                    
                    ForEach(1...15, id: \.self) { _ in
                        CardView() // MARK: - Test Card View (For Scroll Content)
                    }
                }
                .padding(15)
            }
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(CustomScrollBehavior(maxHeight: maxHeight))
    }
    
    // MARK: - Card View
    @ViewBuilder
    func CardView() -> some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                
            )
            .frame(height: 70)
            .overlay(alignment: .leading) {
                HStack(spacing: 12) {
                    Circle()
                        .frame(width: 40, height: 40)
                    
                    VStack(alignment: .leading, spacing: 6, content: {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 100, height: 5)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 70, height: 5)
                    })
                }
                .foregroundStyle(.white.opacity(0.25))
                .padding(15)
            }
    }
    
    // MARK: - Calendar View
    @ViewBuilder
    func CalendarView() -> some View {
        GeometryReader {
            let size = $0.size
            let minY = $0.frame(in: .scrollView(axis: .vertical)).minY
            let maxHeight = size.height - (calendarTitleViewHeight + weekLabelHeight + safeArea.top + 50 + topPadding + bottomPadding - 50)
            let progress = max(min((-minY / maxHeight), 1), 0)
            
            
            VStack(alignment: .leading, spacing: 0, content: {
                Text(currentMonth)
                    .font(.system(size: 35 - (10 * progress)))
                    .offset(y: -50 * progress)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .overlay(alignment: .topLeading, content: {
                        GeometryReader {
                            let size = $0.size
                            
                            Text(year)
                                .font(.system(size: 25 - (10 * progress)))
                                .offset(x: (size.width + 5) * progress, y: progress * 3)
                        }
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(alignment: .topTrailing, content: {
                        HStack(spacing: 15) {
                            Button("", systemImage: "chevron.left") {
                                monthUpdate(false)
                            }
                            .contentShape(.rect)
                            Button("", systemImage: "chevron.right") {
                                monthUpdate(true)
                            }
                            .contentShape(.rect)
                        }
                        .font(.title3)
                        .foregroundStyle(.primary)
                        .offset(x: 150 * progress)
                    })
                    .frame(height: calendarTitleViewHeight)
                
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(Calendar.current.weekdaySymbols, id: \.self) { symbol in
                            Text(symbol.prefix(3))
                                .font(.caption)
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .frame(height: weekLabelHeight, alignment:  .bottom)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(spacing: 0), count: 7), content: {
                        ForEach(selectedMonthDates) { day in
                            Text(day.shortSymbol)
                                .foregroundStyle(day.ignored ? .secondary : .primary)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                            
                                .contentShape(.rect)
                                .onTapGesture {
                                    selectedDate = day.date
                                }
                                .overlay(alignment: .bottom, content: {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 5, height: 5)
                                        .opacity(Calendar.current.isDate(day.date, inSameDayAs: selectedDate) ? 1 : 0)
                                        .offset(y: progress * -2)
                                })
                        }
                    })
                    .frame(height: calendarGridHeight - ((calendarGridHeight - 60) * progress), alignment: .top)
                    .offset(y: (monthProgress * -58) * progress)
                    .contentShape(.rect)
                    .clipped()
                    
                }
                .offset(y: progress * -60)
                
            })
            .foregroundStyle(.white)
            .padding(.horizontal, horizontalPadding)
            .padding(.top, topPadding)
            .padding(.top, safeArea.top)
            .padding(.bottom, bottomPadding)
            .frame(maxHeight: .infinity)
            .frame(height: size.height - (maxHeight * progress), alignment: .top)
            
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.orange, Color.pink, Color.purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .cornerRadius(10)
            )
            
            .clipped()
            .contentShape(.rect)
            .offset(y: -minY)
        }
        .frame(height: calendarHeight)
        .zIndex(1000)
    }
    
    // MARK: - Helper Functions
    
    /// Format the date based on the given format.
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: selectedMonth)
    }
    
    /// Update the selected month based on the increment value.
    func monthUpdate(_ increment: Bool = false) {
        let calendar = Calendar.current
        guard let month = calendar.date(byAdding: .month, value: increment ? 1 : -1, to: selectedMonth) else { return }
        guard let date = calendar.date(byAdding: .month, value: increment ? 1 : 0, to: selectedDate) else { return }
        selectedMonth = month
        selectedDate = date
    }
    
    // MARK: - Computed Properties
    
    /// Get the selected month dates.
    var selectedMonthDates: [Day] {
        return extractDates(selectedMonth)
    }
    
    /// Get the formatted current month.
    var currentMonth: String {
        return format("MMMM")
    }
    
    /// Get the formatted year.
    var year: String {
        return format("YYYY")
    }
    
    /// Calculate the progress of the current month.
    var monthProgress: CGFloat {
        let calendar = Calendar.current
        if let index = selectedMonthDates.firstIndex(where: { calendar.isDate($0.date, inSameDayAs: selectedDate)}) {
            return CGFloat(index / 7).rounded()
        }
        return 1.0
    }
    
    /// Calculate the total calendar height.
    var calendarHeight: CGFloat {
        return calendarTitleViewHeight + calendarGridHeight + weekLabelHeight + safeArea.top + topPadding + bottomPadding
    }
}

#Preview {
    ContentView()
}

// MARK: - Custom Scroll Behavior

struct CustomScrollBehavior: ScrollTargetBehavior {
    var maxHeight: CGFloat
    func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
        if target.rect.minY < maxHeight {
            target.rect = .zero
        }
    }
}

// MARK: - Date Extension

extension Date {
    static var currentMonth: Date {
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(from: Calendar.current.dateComponents([.month, .year], from: .now)) else {
            return .now
        }
        
        return currentMonth
    }
}

// MARK: - View Extension

extension View {
    func extractDates(_ month: Date) -> [Day] {
        var days: [Day] = []
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        
        guard let range = calendar.range(of: .day, in: .month, for: month)?.compactMap({ value -> Date? in
            return calendar.date(byAdding: .day, value: value - 1, to: month)
        }) else {
            return days
        }
        
        let firstWeekDay = calendar.component(.weekday, from: range.first!)
        
        for index in Array(0..<firstWeekDay - 1).reversed() {
            guard let date = calendar.date(byAdding: .day, value: -index - 1, to: range.first!) else { return days }
            let shortSymbol = formatter.string(from: date)
            days.append(.init(shortSymbol: shortSymbol, date: date, ignored: true))
        }
        
        range.forEach { date in
            let shortSymbol = formatter.string(from: date)
            days.append(.init(shortSymbol: shortSymbol, date: date))
        }
        
        let lastWeekDay = 7 - calendar.component(.weekday, from: range.last!)
        if lastWeekDay > 0 {
            for index in 0..<lastWeekDay {
                guard let date = calendar.date(byAdding: .day, value: index + 1, to: range.last!) else { return days }
                let shortSymbol = formatter.string(from: date)
                days.append(.init(shortSymbol: shortSymbol, date: date, ignored: true))
            }
        }
        return days
    }
}

// MARK: - Day Struct

struct Day: Identifiable {
    var id: UUID = .init()
    var shortSymbol: String
    var date: Date
    
    var ignored: Bool = false
}
