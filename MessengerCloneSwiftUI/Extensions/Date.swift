//
//  Date.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 22.01.24.
//

import Foundation

extension Date {
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateFormat = "HH:mm"
        return formatter
    }
    
    private var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateFormat = "MM/dd/yy"
        return formatter
    }
    
    private func timeString() -> String {
        timeFormatter.string(from: self)
    }
    
    private func dateString() -> String {
        dayFormatter.string(from: self)
    }
    
    func timestampString() -> String {
        if Calendar.current.isDateInToday(self) {
            return timeString()
        } else {
            return dateString()
        }
    }
}
