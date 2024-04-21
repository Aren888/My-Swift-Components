//
//  DailySalesChartView.swift
//  Tong Ai
//
//  Created by Solicy Office on 19.04.24.
//

import SwiftUI
import Charts

@available(macOS 14.0, *)
struct DailySalesChartView: View {
    
    let salesData: [Sale]
    
    init(salesData: [Sale]) {
        self.salesData = salesData
        
        guard let lastDate = salesData.last?.saleDate else { return }
        let beginingOfInterval = lastDate.addingTimeInterval(-1 * 3600 * 24 * 30)
        
        self._scrollPosition = State(initialValue: beginingOfInterval.timeIntervalSinceReferenceDate)

    }
    
    let numberOfDisplayedDays = 30
    
    @State var scrollPosition: TimeInterval = TimeInterval()
    
    var scrollPositionStart: Date {
        Date(timeIntervalSinceReferenceDate: scrollPosition)
    }
    
    var scrollPositionEnd: Date {
        scrollPositionStart.addingTimeInterval(3600 * 24 * 30)
    }
    
    var scrollPositionString: String {
        scrollPositionStart.formatted(.dateTime.month().day())
    }
    
    var scrollPositionEndString: String {
        scrollPositionEnd.formatted(.dateTime.month().day().year())
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text("\(scrollPositionString) – \(scrollPositionEndString)")
                .font(.callout)
                .foregroundStyle(.secondary)
            
            Chart(salesData, id: \.saleDate) {
                BarMark(
                    x: .value("Day", $0.saleDate, unit: .day),
                    y: .value("Sales", $0.quantity)
                )
            }
            .chartScrollableAxes(.horizontal)
            .chartXVisibleDomain(length: 3600 * 24 * numberOfDisplayedDays)
            .chartScrollTargetBehavior(
                .valueAligned(
                    matching: .init(hour: 0),
                    majorAlignment: .matching(.init(day: 1))))
            .chartScrollPosition(x: $scrollPosition)
            .foregroundStyle(.black)
        }
    }
}

@available(macOS 14.0, *)
#Preview {
    DailySalesChartView(salesData: ProgressViewModel.preview.salesData)
        .aspectRatio(1, contentMode: .fit)
        .padding()
}
