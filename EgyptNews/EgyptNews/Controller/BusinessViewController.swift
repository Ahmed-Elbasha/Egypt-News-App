//
//  BusinessViewController.swift
//  EgyptNews
//
//  Created by Ahmed Elbasha on 7/21/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import CoreData

class BusinessViewController: UIViewController {

    @IBOutlet weak var stateView: UIView!
    @IBOutlet weak var dataStateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateForUIControls()
        setDataSourcceForUIControls()
    }
    
    func setDelegateForUIControls() {
        tableView.delegate = self
    }
    
    func setDataSourcceForUIControls() {
        tableView.dataSource = self
    }

    @IBAction func refreshButtonPressed(_ sender: Any) {
    }
    
}

