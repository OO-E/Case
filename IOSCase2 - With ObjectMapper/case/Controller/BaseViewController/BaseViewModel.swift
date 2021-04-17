//
//  BaseViewModel.swift
//  case
//
//  Created by OO E on 24.01.2021.
//
import UIKit
import SimpleTwoWayBinding

enum ErrorState {
    
    case showWith(title: String, message: String)
    case logout
    case none
}

enum LoaderState {
    case show
    case dismiss
}


enum ReloadState {
    case reload
}

class BaseViewModel:NSObject {
    
    var parentController: BaseViewController!
    var errorState: Observable<ErrorState> = Observable()
    var loaderState: Observable<LoaderState> = Observable()
        
    init(parent: BaseViewController) {
        super.init()
        self.parentController = parent
        configuration()
    }
    
    override init() {
        super.init()
        configuration()
    }
    
    private func configuration() {
        
        loaderState.bind { (observable, state) in
            switch state {
            case .show:
                self.parentController.showLoader()
                break
            case .dismiss:
                self.parentController.dismissLoader()
                break
            }
        }
        
        errorState.bind { (observable, state) in
            switch state {
            case .showWith(let title, let message):
                self.parentController.showMessageWith(title: title, message: message)
                break
            case .logout:
                //TODO --
                break
            case .none:
                break
            }
        }
        
    }
    
    func setParent(parent: BaseViewController) {
        self.parentController = parent
    }
    
}
