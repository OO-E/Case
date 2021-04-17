//
//  TermDetailController.swift
//  IOSCase
//
//  Created by OO E on 6.09.2020.
//  Copyright © 2020 ozgun. All rights reserved.
//

import UIKit

class TermDetailController: BaseViewController {
    
    var _view: TermDetailView!
    var viewModel: TermDetailViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureController() {
        super.configureController()
        _view = TermDetailView(frame: self.view.frame)
        self.view.addSubview(_view)
    }
    
    override func bindViewModel() {
        super.bindViewModel()
       
        guard viewModel != nil else  {
            mainThread {
                self.showMessage(message: "Bir hata oluştu")
            }
            return
        }
        
        _view.artWorkImageView.download(url: viewModel.getArtWorkUrl())
        _view.termTitleLabel.text = viewModel.getTermTitle()
        _view.termDescriptionLabel.text = viewModel.getTermDescription()
    }
    
 
    
}
