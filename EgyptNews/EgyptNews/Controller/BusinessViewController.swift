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

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class BusinessViewController: UIViewController {

    @IBOutlet weak var stateView: UIView!
    @IBOutlet weak var dataStateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var newsArticles: [NewsArticle]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateForUIControls()
        setDataSourcceForUIControls()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        performNewFetchRequest()
    }
    
    func setDelegateForUIControls() {
        tableView.delegate = self
    }
    
    func setDataSourcceForUIControls() {
        tableView.dataSource = self
    }
    
    func retrieveUris(handler: @escaping(_ status: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let newsArticle = NSEntityDescription.entity(forEntityName: "NewsArticle", in: managedContext)
        Alamofire.request(getApiRequestUrl(forApiKey: apiKey, withCountry: country, withCategory: Category.business.rawValue)).responseJSON { (response) in
            guard let rootJsonObject = response.result.value as? Dictionary<String,AnyObject> else { return }
            let articles = rootJsonObject["articles"] as! [Dictionary<String, AnyObject>]
            
            for article in articles {
                let newArticle = NSManagedObject(entity: newsArticle!, insertInto: managedContext)
                let sources = article["source"] as! Dictionary<String, AnyObject>
                let sourceName = sources["name"] as! String
                newArticle.setValue(sourceName, forKey: "articleSourceName")
                let articleTitle = article["title"] as! String
                newArticle.setValue(articleTitle, forKey: "articleTitle")
                let articleUri = article["url"] as! String
                newArticle.setValue(articleUri, forKey: "articleURL")
                let publishDate = article["publishedAt"] as! String
                newArticle.setValue(publishDate, forKey: "publishDate")
                
                do {
                    try managedContext.save()
                    print("Data Downloaded and Saved..")
                } catch {
                    print("Operation Failed.. \(error.localizedDescription)")
                }
            }
        }
        handler(true)
    }
    
    func fetchNewsArticleData(completion: (_ complete: Bool) -> () ) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let fetchRequest = NSFetchRequest<NewsArticle>(entityName: "NewsArticle")
        
        do {
            newsArticles = try managedContext.fetch(fetchRequest)
            print("Data is Fetched.")
            completion(true)
        } catch {
            print("Fetch Operation Failed.. \(error.localizedDescription) ")
            completion(false)
        }
    }
    
    func cancelAllSessions() {
        Alamofire.SessionManager.default.session.getTasksWithCompletionHandler { (sessionDataTask, sessionUploadTask, sessionDownloadTak) in
            sessionDataTask.forEach({ $0.cancel() })
            sessionUploadTask.forEach({ $0.cancel() })
            sessionDownloadTak.forEach({ $0.cancel() })
        }
    }
    
    func performNewFetchRequest() {
        cancelAllSessions()
        newsArticles = []
        tableView.reloadData()
        retrieveUris { (complete) in
            if complete {
                self.tableView.reloadData()
                self.fetchNewsArticleData(completion: { (complete) in
                    if complete {}
                })
            } else {
                return
            }
        }
    }

    @IBAction func refreshButtonPressed(_ sender: Any) {
        performNewFetchRequest()
    }
    
}

