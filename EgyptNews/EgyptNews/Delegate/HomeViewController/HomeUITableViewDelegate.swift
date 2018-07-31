//
//  HomeUITableViewDelegate.swift
//  EgyptNews
//
//  Created by Ahmed Elbasha on 7/29/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCategoryCell", for: indexPath) as UITableViewCell
        let newsCategory = newsCategories[indexPath.row]
        cell.textLabel?.text = newsCategory
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsCategories.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveToDesignatedViewController(rowIndex: indexPath.row)
    }
    
}
