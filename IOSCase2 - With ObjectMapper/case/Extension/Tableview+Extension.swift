//
//  Tableview+Extension.swift
//  case
//
//  Created by OO E on 24.01.2021.
//

import UIKit

extension UITableView {
    
    func registerNib<T>(witClassAndIdentifier:T.Type) {
        
        self.register(UINib.init(nibName: String(describing: T.self), bundle: nil), forCellReuseIdentifier: String(describing: T.self))
    }
    
    func reloadData(completion: @escaping () -> ()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData()})
        {_ in completion() }
    }
    
    
    func dequeueCell<T>(withClassAndIdentifier classAndIdentifier: T.Type, for indexPath: IndexPath) -> T {
        
        return self.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}
