//
//  NewsDetailViewModel.swift
//  case
//
//  Created by OO E on 24.01.2021.
//

import UIKit

class NewsDetailViewModel: BaseViewModel {
    
    var article: ArticlesModel!
    
    init(article: ArticlesModel) {
        super.init()
        self.article = article
    }
}
