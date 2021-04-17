//
//  BaseModel.swift
//  case
//
//  Created by OO E on 24.01.2021.
//

import ObjectMapper

class BaseModel<T: Mappable>: Mappable {
    var status: String?
    var totalResults: Int?
    var articles: [T]?
    
    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
        
        status <- map["status"]
        totalResults <- map["totalResults"]
        articles <- map["articles"]
    }
}
