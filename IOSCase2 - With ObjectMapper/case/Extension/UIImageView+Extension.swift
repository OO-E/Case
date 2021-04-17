//
//  UIImageView.swift
//  case
//
//  Created by OO E on 24.01.2021.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func download(url: String?) {
        if let _url = url {
            self.kf.setImage(with: URL(string: _url))
        } else {
            self.image = UIImage(named: "placeholder")
        }
        
    }
}
