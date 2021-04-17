//
//  ViewController.swift
//  IOSCase
//
//  Created by OO E on 4.09.2020.
//  Copyright © 2020 ozgun. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class TermsListController: BaseViewController {
    
    
    var _view: TermsListView!
    var viewMoldel: TermsListViewModel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func configureController() {
        super.configureController()
        //--- View Element
        _view = TermsListView(frame: self.view.frame)
        _view.tableView.delegate = self
        _view.tableView.dataSource = self
        _view.searchController.delegate = self
        self.navigationItem.searchController = _view.searchController
        self.view.addSubview(_view)
    }

    override func bindViewModel() {
        super.bindViewModel()
        viewMoldel = TermsListViewModel(dependencies: .init(api: ClientApi()))
        
        let input = TermsListViewModel.Input.init(
            searchText: _view.searchController.searchBar.rx.text.orEmpty.distinctUntilChanged().debounce(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance).filter{ !$0.isEmpty}.asDriver(onErrorJustReturn: "Error For Search"),
            selected: _view.tableView.rx.itemSelected.asDriver())
        
        viewMoldel.transform(input: input)
        
        viewMoldel.showErrorMessage.subscribe { (event) in
            guard event.element != nil else{
                return
            }
            mainThread {
                self.showMessage(message: event.element!)
            }
            
            
        }.disposed(by: disposeBag)
        
        viewMoldel.result.subscribe { (event) in

        }.disposed(by: disposeBag)
        
        viewMoldel.element.subscribe({ (event) in
            guard event.element != nil else{
                return
            }
            mainThread {
                self._view.tableView.reloadData()
            }
            
            
        }).disposed(by: disposeBag)
    }
    
}

extension TermsListController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewMoldel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TermsTableViewCell", for: indexPath) as! TermsTableViewCell
        let item = viewMoldel.getTermsModel(index: indexPath.row)
        cell.arrange(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = viewMoldel.getTermsModel(index: indexPath.row)
        self.router.push.termDetail(item: item)
    }
    
}

extension TermsListController: UISearchControllerDelegate {
    
}

