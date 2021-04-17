//
//  NewsRequest.swift
//  case
//
//  Created by OO E on 24.01.2021.
//

import Foundation
import ObjectMapper
import Alamofire

enum Method {
    case Get
    case Put
    case Post
    case Delete
}

protocol Request {
    var url: String? {get set}
    var method:HTTPMethod {get set}
    var parameters: [String: Any]? {get}
    var header: HTTPHeaders? {get}
}

class NewsRequest: Request {
    
    var url: String?
    
    var method: HTTPMethod = .get
    
    var parameters: [String : Any]? {
        return nil
    }
    var header: HTTPHeaders? {
        return nil
    }
    
    init(country: String, query: String) {
        url = "v2/top-headlines?q=\(query)&country=\(country)&apiKey=e371fa3c63944d47be8a66d293cbcd8c"
    }

}
