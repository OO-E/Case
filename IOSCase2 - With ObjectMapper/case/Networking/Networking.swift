//
//  Networking.swift
//  case
//
//  Created by OO E on 24.01.2021.
//

import AlamofireObjectMapper
import Alamofire
import ObjectMapper
import Reachability

class Networking {
    
    private let baseUrl = "https://newsapi.org/"
    
    public enum Error: Swift.Error {
        case server(code: Int!, description: String)
        case networkError(description: String)
        case other
        
        func getDescription() -> String {
            
            switch self {
            case .networkError(let desc):
                return desc
            case .server(let code, let desc):
                return desc
            default:
                return "-"
            }
            
        }
    }
    
    func request<R:Request, GenericResponse:Mappable>(item: R, responseCompletion:@escaping (GenericResponse?, Networking.Error?)-> Void) {
        
        let url = baseUrl + (item.url ?? "")
        
        let connection  = ReachabilityManager.shared.reachability.connection
        if connection == .unavailable {
            responseCompletion(nil,.networkError(description: "You don't have any connection, please check your network"))
            return
        }
        
        Alamofire.request(url, method: item.method, parameters: item.parameters, headers: item.header).responseObject { (response: DataResponse<GenericResponse>) in
            
            if response.error == nil {
                responseCompletion(response.result.value, nil)
            } else {
                responseCompletion(nil, .server(code: response.response?.statusCode, description: response.response.debugDescription))
            }
            
        }
        
        
    }
    
    
}

