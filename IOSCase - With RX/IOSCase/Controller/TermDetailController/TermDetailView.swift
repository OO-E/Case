//
//  TermDetailView.swift
//  IOSCase
//
//  Created by OO E on 6.09.2020.
//  Copyright © 2020 ozgun. All rights reserved.
//

import UIKit

class TermDetailView: UIView, ViewType {
    
    var artWorkImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var termTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var termDescriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Constructure Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        self.backgroundColor = .white
        
        //--- UIImageView
        self.addSubview(artWorkImageView)
        artWorkImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        artWorkImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        artWorkImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        artWorkImageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        
        //--- UILabel
        self.addSubview(termTitleLabel)
        termTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        termTitleLabel.topAnchor.constraint(equalTo: self.artWorkImageView.bottomAnchor, constant: 10).isActive = true
        termTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        termTitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        //---
        self.addSubview(termDescriptionLabel)
        termDescriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        termDescriptionLabel.topAnchor.constraint(equalTo: self.termTitleLabel.bottomAnchor, constant: 10).isActive = true
        termDescriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        termDescriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        
        
        
        
    }
}
