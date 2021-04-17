//
//  ClientApi.swift
//  IOSCase
//
//  Created by OO E on 4.09.2020.
//  Copyright © 2020 ozgun. All rights reserved.
//

import RxSwift
import RxCocoa


protocol ClientApiTermsProvider {
    func fetchGetTerms(value: String) -> Observable<Result?>
}

protocol ClientApiProvider: ClientApiTermsProvider { }

final class ClientApi: ClientApiProvider {
    
    private struct Constants {
        static let baseUrl = "https://itunes.apple.com/"
    }
    
    private let httpClient: HTTPClientProvider
    
    init(httpClient: HTTPClientProvider = HTTPClient()) {
        self.httpClient = httpClient
    }
    
    func fetchGetTerms(value: String) -> Observable<Result?> {
        let url = "\(Constants.baseUrl)search?term=\(value)&limit=12"
        return httpClient.get(url: url).map { (data) -> Result? in
            guard let data = data, let response = try? JSONDecoder().decode(Result.self, from: data) else {
                return nil
            }
            return response
        }
    }
}
