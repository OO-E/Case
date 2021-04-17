//
//  TermsListViewModel.swift
//  IOSCase
//
//  Created by OO E on 4.09.2020.
//  Copyright © 2020 ozgun. All rights reserved.
//
import UIKit
import RxSwift
import RxCocoa

class TermsListViewModel: ViewModelType {
    
    struct Input {
        let searchText: Driver<String>
        let selected: Driver<IndexPath>
    }
    
    struct Dependencies {
        let api: ClientApiProvider
    }
    private let dependencies: Dependencies
    
    var showErrorMessage: PublishSubject<String>!
    var result: Observable<Result>!
    var element: BehaviorRelay<Result>!
    
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func transform(input: Input) {
        
        let nonResult = Result(resultCount: 0, results: [], errorCode: nil, errorMessage: nil)
        self.showErrorMessage = PublishSubject<String>()
        self.element = BehaviorRelay<Result>(value: nonResult)
            
        self.result = input.searchText.asObservable().flatMapLatest { (text) -> Observable<Result> in
            let searchText = text
            return self.dependencies.api.fetchGetTerms(value: searchText).map { (result) -> Result in
                guard let _result = result else {
                    self.showErrorMessage!.onNext("Bir hata oluştu")
                    return nonResult
                }
                
                guard _result.errorCode == nil else {
                    self.showErrorMessage.onNext(_result.errorMessage ?? "Bir hata oluştu")
                    return _result
                }
                
                self.element?.accept(_result)
                return _result
            }
            }.asDriver(onErrorJustReturn: nonResult).asObservable()

        
       
    }
    
    func getNumberOfRows() -> Int {
        return element.value.resultCount
    }
    
    func getTermsModel(index: Int) -> TermsModel {
        return element.value.results[index]
    }
    
}
