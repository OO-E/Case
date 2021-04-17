//
//  NewsDetailController.swift
//  case
//
//  Created by OO E on 24.01.2021.
//

import UIKit

class NewsDetailController: BaseViewController {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    var viewModel: NewsDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        
        self.navigationItem.title = viewModel.article.source?.name
        viewModel.setParent(parent: self)
        
        textView.text = viewModel.article.content ?? ""
        titleLabel.text = viewModel.article.title ?? ""
        newsImageView.download(url: viewModel.article.urlToImage)
        
        if viewModel.article.url == nil {
            detailButton.isHidden = true
        }
        
    }
    
    @IBAction func actionTapped(_ sender: Any) {
        guard let url = URL(string: viewModel.article.url!) else { return }
        UIApplication.shared.open(url)
    }
}
