//
//  Result.swift
//  IOSCase
//
//  Created by OO E on 4.09.2020.
//  Copyright © 2020 ozgun. All rights reserved.
//

import Foundation

struct Result: Codable {
    let resultCount: Int
    let results: [TermsModel]
    let errorCode:String?
    let errorMessage: String?
}

struct AAA: Codable {
    let key: Int
    let title : String
}
