//
//  BusinessTableViewDelegate.swift
//  EgyptNews
//
//  Created by Ahmed Elbasha on 7/26/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension BusinessViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArticles!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessNewsArticleCell", for: indexPath) as? BusinessNewsArticleCell else { return UITableViewCell() }
        let newsArticle = newsArticles![indexPath.row]
        let imageUrl = imageUrls?[indexPath.row]
        let resource = ImageResource(downloadURL: URL(string: imageUrl!)!, cacheKey: imageUrl)
//        let currentImage: UIImage!
//        if newsArticle.articleImageUrl != "" {
//            currentImage = images[indexPath.row]
//        } else {
//            currentImage = UIImage(named: "no_image")
//        }
        if cell.isKind(of: BusinessNewsArticleCell.self) {
            cell.configureCell(withNewsArticle: newsArticle, resource: resource)
        } else if cell.isKind(of: UITableViewCell.self) {
            cell.newsArticleLabel.text = newsArticle.articleTitle
            cell.newsArticleSourceLabel.text = newsArticle.articleSourceName
            cell.publishDateLabel.text = newsArticle.publishDate
            cell.newsArticleImageView.kf.setImage(with: resource, placeholder: UIImage(named: "no_image"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "MoveToShowNewsArticleViewController", sender: self)
    }

}
