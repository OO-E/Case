//
//  TermsTableViewCell.swift
//  IOSCase
//
//  Created by OO E on 4.09.2020.
//  Copyright © 2020 ozgun. All rights reserved.
//

import UIKit
class TermsTableViewCell: UITableViewCell {
    
    var termsImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .white 
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    var termsTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    var termsShortDescriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        
        //--- termsImageView
        self.addSubview(termsImageView)
        termsImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        termsImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        termsImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        termsImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        
        //--- termsTitleLabel
        self.addSubview(termsTitleLabel)
        termsTitleLabel.topAnchor.constraint(equalTo: termsImageView.topAnchor, constant: 0).isActive = true
        termsTitleLabel.leadingAnchor.constraint(equalTo: termsImageView.trailingAnchor, constant: 8).isActive = true
        termsTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        termsTitleLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
            
        //--- termsShortDescriptionLabel
        self.addSubview(termsShortDescriptionLabel)
        termsShortDescriptionLabel.topAnchor.constraint(equalTo: termsTitleLabel.bottomAnchor, constant: 0).isActive = true
        termsShortDescriptionLabel.leadingAnchor.constraint(equalTo: termsImageView.trailingAnchor, constant: 8).isActive = true
        termsShortDescriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        termsShortDescriptionLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true

        
    }
    
    func arrange(item: TermsModel) {
        termsTitleLabel.text = item.collectionName ?? "-"
        termsShortDescriptionLabel.text = item.shortDescription ?? "-"
        termsImageView.download(url: item.artworkUrl100)
        
    }
    
}
