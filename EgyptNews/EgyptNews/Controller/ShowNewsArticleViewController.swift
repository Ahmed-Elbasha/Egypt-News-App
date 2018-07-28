//
//  ShowNewsArticleViewController.swift
//  EgyptNews
//
//  Created by Ahmed Elbasha on 7/21/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit
import WebKit
class ShowNewsArticleViewController: UIViewController {
    
    @IBOutlet weak var newsArticlePreviewWebKitView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func returnButtonWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
