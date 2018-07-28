//
//  BusinessNewsArticleCell.swift
//  EgyptNews
//
//  Created by Ahmed Elbasha on 7/22/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class BusinessNewsArticleCell: UITableViewCell {

    @IBOutlet weak var newsArticleSourceLabel: UILabel!
    @IBOutlet weak var newsArticleLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(withNewsArticle  newsArticle: NewsArticle) {
        newsArticleLabel.text = newsArticle.articleTitle
        newsArticleSourceLabel.text = newsArticle.articleSourceName
        publishDateLabel.text = newsArticle.publishDate
    }
}
