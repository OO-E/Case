//
//  NewsListTableViewCell.swift
//  case
//
//  Created by OO E on 24.01.2021.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func arrange(item: ArticlesModel) {
        titleLabel.text = item.title
        sourceLabel.text = item.source?.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        if let _date = item.publishedAt?.getDate() {
            let formattedDate = dateFormatter.string(from: _date)
            dateLabel.text = formattedDate
        }
        
        
        
    }
    
}
