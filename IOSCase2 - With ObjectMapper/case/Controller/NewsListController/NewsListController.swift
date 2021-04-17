//
//  NewsListController.swift
//  case
//
//  Created by OO E on 24.01.2021.
//

import UIKit
class NewsListController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: NewsListViewModel!
    var searchController: UISearchController = {
           let searchController = UISearchController(searchResultsController: nil)
           searchController.searchBar.placeholder = "Search news"
           return searchController
       }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        viewModel = NewsListViewModel()
        viewModel.setParent(parent: self)
        
        self.navigationItem.title = "News"

        searchController.searchResultsUpdater = self
        self.navigationItem.searchController = searchController

        tableView.registerNib(witClassAndIdentifier: NewsListTableViewCell.self)
        
        tableView.rowHeight = UITableView.automaticDimension
        
        viewModel.articles.bind { (observable, value) in
            self.tableView.reloadData()
        }
    }
}

extension NewsListController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let query = searchController.searchBar.text , query != "" {
            viewModel.getNews(query: query)
        }
        
    }
    
    
}

extension NewsListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListTableViewCell") as! NewsListTableViewCell
        if let _item = viewModel.articles.value?[indexPath.row] {
            cell.arrange(item: _item)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let article = self.viewModel.articles.value?[indexPath.row] {
            let detail = NewsDetailController.createFromStoryboard()
            detail.viewModel = NewsDetailViewModel(article: article)
            self.navigationController?.pushViewController(detail, animated: true)
        }
        self.tableView.deselectRow(at: indexPath, animated: false)
        
    }
}
