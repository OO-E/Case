//
//  DateFormatter.swift
//  case
//
//  Created by OO E on 24.01.2021.
//

import Foundation

extension DateFormatter {
    struct Parts: OptionSet {
        var rawValue: Int
        
        static let date = Parts(rawValue: 1 << 0)
        
        static let hour = Parts(rawValue: 1 << 3)
        static let minute = Parts(rawValue: 1 << 4)
        static let second = Parts(rawValue: 1 << 5)
        
        static let shortTime: Parts = [.hour, .minute]
        static let longTime: Parts = [.hour, .minute, .second]
    }
    
    static func createTR(parts: Parts = [.date, .shortTime]) -> DateFormatter {
        
        var template = ""
        
        if parts.contains(.date) {
            template.append("dd.MM.yyyy")
        }
        if parts.contains(.hour) || parts.contains(.minute) || parts.contains(.second) {
            template.append(",")
        }
        if parts.contains(.hour) {
            template.append("HH")
        }
        if parts.contains(.minute) {
            template.append(":mm")
        }
        if parts.contains(.second) {
            template.append(":ss")
        }
        return createTR(format: template)
    }
    
    static func createTR(format: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.init(identifier: "tr-TR")
        dateFormatter.timeZone = TimeZone(identifier: "Europe/Istanbul")
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = format
        return dateFormatter
    }
}
