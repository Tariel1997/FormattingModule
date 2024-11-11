// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public protocol FormattingProtocol {
    func formatDate(_ dateString: String) -> String
}

public class DateFormatterForNews: FormattingProtocol {
    private let dateFormatter: DateFormatter
    
    public init() {
        self.dateFormatter = DateFormatter()
    }
    
    public func formatDate(_ dateString: String) -> String {
        let formats = [
            "yyyy-MM-dd'T'HH:mm:ssZ",
            "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
            "yyyy-MM-dd HH:mm:ss",
            "yyyy-MM-dd"
        ]
        
        for format in formats {
            dateFormatter.dateFormat = format
            if let date = dateFormatter.date(from: dateString) {
                dateFormatter.dateFormat = "MMM dd, yyyy"
                return dateFormatter.string(from: date)
            }
        }
        
        print("Failed to parse date: \(dateString)")
        return "Unknown Date"
    }
}

