//
//  TermDetailViewModel.swift
//  IOSCase
//
//  Created by OO E on 6.09.2020.
//  Copyright © 2020 ozgun. All rights reserved.
//

import UIKit

class TermDetailViewModel{
    
    var termItem: TermsModel!
    
    init(item: TermsModel) {
        self.termItem = item
    }
    
    
    func getArtWorkUrl() -> String? {
        return termItem.artworkUrl100
    }
    
    func getTermTitle() -> String {
        return termItem.collectionName ?? "-"
    }
    
    func getTermDescription() -> String {
        return termItem.longDescription ?? "-"
    }
    
}
