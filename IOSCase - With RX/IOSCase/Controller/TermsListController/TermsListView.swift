//
//  TermsListView.swift
//  IOSCase
//
//  Created by OO E on 4.09.2020.
//  Copyright © 2020 ozgun. All rights reserved.
//

import UIKit

class TermsListView: UIView, ViewType {
    
    //MARK: UI Elements
    var tableView: UITableView  = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(TermsTableViewCell.self, forCellReuseIdentifier: "TermsTableViewCell")
        tableView.rowHeight = 80
        return tableView
    }()
    
    var searchController: UISearchController = {
           let searchController = UISearchController(searchResultsController: nil)
           searchController.searchBar.placeholder = "Search for terms"
           return searchController
       }()
  
    //MARK: Constructure Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: Configurations
    func configureView() {
        
        self.backgroundColor = .white
        //--- TableView
        tableView.frame = self.frame
        
        //--- UI Element addSubView ---
        self.addSubview(tableView)
        
    }
    
}
