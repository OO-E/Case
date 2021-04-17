//
//  Extension+UIImageView.swift
//  IOSCase
//
//  Created by OO E on 5.09.2020.
//  Copyright © 2020 ozgun. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func download(url: String?) {
        if let _url = url {
            self.kf.setImage(with: URL(string: _url))
        } else {
            self.image = UIImage(named: "img.gallery")
        }
        
    }
}


