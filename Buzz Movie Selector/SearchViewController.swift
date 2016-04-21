//
//  SearchViewController.swift
//  Buzz Movie Selector
//
//  Created by Alejandrina Patron on 4/20/16.
//  Copyright © 2016 Ale Patrón. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Search"
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let key = searchBar.text {
            key.trim()
            let newKey = key.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.LiteralSearch, range: nil)
            if (newKey != "") {
                searchMovies(newKey)
            }
        }
    }
    
    func searchMovies(key: String) {
        let url = Constants.searchURL + "&q=" + key + "&page_limit=15"
        print(url)
        Alamofire.request(.GET, url).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    var res = JSON(value)
                    let total = Int(String(res["total"]))!
                    print(total)
                    if (total > 0) {
                        if total >= 15 {
                            for i in 0...14 {
                                if let title = res["movies"][i]["title"].string {
                                    let year = String(res["movies"][i]["year"])
                                    print(title)
                                    print(year)
                                }
                            }
                        } else {
                            for i in 0...total - 1 {
                                if let title = res["movies"][i]["title"].string {
                                    let year = String(res["movies"][i]["year"])
                                    print(title)
                                    print(year)
                                }
                            }
                        }
                    } else {
                        self.showAlert("noResults")
                    }                }
            case .Failure(let error):
                self.showAlert("searchFailure")
                print(error)
            }
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func showAlert(alertType: String) {
        switch alertType {
        case "noResults":
            let alert = UIAlertController(title: "😢", message: "No movies found...", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Ok", style: .Default) { _ in }
            alert.addAction(action)
            self.presentViewController(alert, animated: true) {}
            
        case "searchFailure":
            let alert = UIAlertController(title: "Something went wrong", message: "Are you sure you are connected to the Internet? 🔌🌎", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Ok", style: .Default) { _ in }
            alert.addAction(action)
            self.presentViewController(alert, animated: true) {}
            
        default:
            break
        }
    }
}
