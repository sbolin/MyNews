//
//  Formatters.swift
//  MyNews
//
//  Created by Scott Bolin on 28-Apr-21.
//

import Foundation

struct Formatters {
    
    static var apiDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter
    }
    
    static var dailyDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM"
        return dateFormatter
    }
}
