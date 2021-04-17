//
//  ErrorGenerator.swift
//  IOSCase
//
//  Created by OO E on 4.09.2020.
//  Copyright © 2020 ozgun. All rights reserved.
//

import Foundation
//FIXME: asasd
class ErrorGenerator {
    
    static var jsonModelString = """
                                        {
                                            "resultCount":0.0,
                                            "results":[],
                                            "errorCode":"[COD]",
                                            "errorMessage": "[ERROR_MESSAGE]"
                                        }
                                    """
    
    static func generateResultWithError(error: String) -> Data {
        
        if(error.contains("401")){
            jsonModelString = jsonModelString.replacingOccurrences(of: "[COD]", with: "401").replacingOccurrences(of: "[ERROR_MESSAGE]", with: "Unauthorized Request")
        }
        else if(error.contains("404")){
            jsonModelString = jsonModelString.replacingOccurrences(of: "[COD]", with: "404").replacingOccurrences(of: "[ERROR_MESSAGE]", with: "Not Found")
        }
        if(error.contains("500")){
            jsonModelString = jsonModelString.replacingOccurrences(of: "[COD]", with: "500").replacingOccurrences(of: "[ERROR_MESSAGE]", with: "Internal Server Error")
        }
        else {
            jsonModelString = jsonModelString.replacingOccurrences(of: "[COD]", with: "501").replacingOccurrences(of: "[ERROR_MESSAGE]", with: "Unkown Error")
        }
        return jsonModelString.data(using: .utf8)!
    }
    
}
