//
//  NewsListViewModel.swift
//  case
//
//  Created by OO E on 24.01.2021.
//

import UIKit
import SimpleTwoWayBinding

class NewsListViewModel: BaseViewModel {
    
    
    var articles: Observable<[ArticlesModel]> = Observable()
    private var lastSearch: String!
    
    override init() {
        super.init()
        articles.value = []
    }
    
    func getNews(query: String) {
        lastSearch = query
        loaderState.value = .show
        let resut = NewsRequest(country: "tr",query: query)
        Networking().request(item: resut) { (response: BaseModel<ArticlesModel>?, error: Networking.Error?) in
            
            self.loaderState.value = .dismiss
            if error == nil {
                self.articles.value = response?.articles
            } else {
                self.errorState.value = .showWith(title: "Network Error", message: (error?.getDescription())!)
            }
            
        }
    }
    
    
    func getNumberOfRows() -> Int {
        return articles.value?.count ?? 0
    }
    
}
