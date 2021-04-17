//
//  BaseRouter.swift
//  IOSCase
//
//  Created by OO E on 6.09.2020.
//  Copyright © 2020 ozgun. All rights reserved.
//

import UIKit

protocol Router {
    
    init(parent: BaseViewController)
    func termDetail(item: TermsModel)
}



class BaseRouter {
    
    private(set) var parent: BaseViewController!
    var push: Push!
    var present:Present!
    
    init(parent: BaseViewController) {
        self.parent = parent
        push = Push(parent: parent)
        present = Present(parent: parent)
    }
    
}

class Push: Router {
    private(set) var parent: BaseViewController!
    
    required init(parent: BaseViewController) {
        self.parent = parent
    }
    
    func termDetail(item: TermsModel) {
        let termDetail = TermDetailController()
        termDetail.viewModel = TermDetailViewModel(item: item)
        self.parent.navigationController?.pushViewController(termDetail, animated: true)
    }
}

class Present: Router {
    private(set) var parent: BaseViewController!
    
    required init(parent: BaseViewController) {
        self.parent = parent
    }
    
    func termDetail(item: TermsModel) {
        
    }
       
}
