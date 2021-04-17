//
//  String+Extension.swift
//  case
//
//  Created by OO E on 24.01.2021.
//

import UIKit

extension String {
    func diacriticInsensitiveLowercased() -> String {
        return folding(options: .diacriticInsensitive, locale: .current).lowercased()
    }
    
    func getDate() -> Date? {
        let dateFormatter = DateFormatter.createTR()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        if let date = dateFormatter.date(from: self) {
            return date
        }
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: self) {
            return date
        }
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: self) {
            return date
        }
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let date = dateFormatter.date(from: self) {
            return date
        }
        
        
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        if let date = dateFormatter.date(from: self) {
            return date
        }
        
        return nil
    }
}
