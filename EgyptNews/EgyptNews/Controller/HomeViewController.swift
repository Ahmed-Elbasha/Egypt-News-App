//
//  HomeViewController.swift
//  EgyptNews
//
//  Created by Ahmed Elbasha on 7/29/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var newsCategories: [String] = ["Business", "Arts", "Politics", "Sports", "Technology"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateForUIControls()
        setDataSourceForUIControls()
    }
    
    func setDelegateForUIControls() {
        tableView.delegate = self
    }
    
    func setDataSourceForUIControls() {
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveToDesignatedViewController(rowIndex: Int) {
        switch rowIndex {
        case 0:
            let businessVC = storyboard?.instantiateViewController(withIdentifier: "BusinessViewController") as! BusinessViewController
            self.present(businessVC, animated: true, completion: nil)
            break
        case 1:
            let artsVC = storyboard?.instantiateViewController(withIdentifier: "ArtsViewController") as! ArtsViewController
            self.present(artsVC, animated: true, completion: nil)
            break
        case 2:
            let politicsVC = storyboard?.instantiateViewController(withIdentifier: "PoliticsViewController") as! PoliticsViewController
            self.present(politicsVC, animated: true, completion: nil)
            break
        case 3:
            let sportsVC = storyboard?.instantiateViewController(withIdentifier: "SportsViewController") as! SportsViewController
            self.present(sportsVC, animated: true, completion: nil)
            break
        case 4:
            let technologyVC = storyboard?.instantiateViewController(withIdentifier: "TechnologyViewController") as! TechnologyViewController
            self.present(technologyVC, animated: true, completion: nil)
            break
        default:
            break
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
