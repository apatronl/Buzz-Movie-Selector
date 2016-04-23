//
//  NewReleasesViewController.swift
//  Buzz Movie Selector
//
//  Created by Alejandrina Patron on 4/22/16.
//  Copyright © 2016 Ale Patrón. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class NewReleasesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var newInTheatersMovies: [Movie] = []
    var newDvds: [Movie] = []
    var newInTheatersLoaded: Bool = false
    var newDVDsLoaded: Bool = false
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNewInTheaters()
        newInTheatersLoaded = true
        tableView.delegate = self
        tableView.registerNib(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
        tableView.dataSource = self
    }
    
    @IBAction func segmentedControlAction(sender: UISegmentedControl) {
        if (segmentedControl.selectedSegmentIndex == 0) {
            if (!newInTheatersLoaded) {
                newInTheatersMovies.removeAll()
                tableView.reloadData()
                getNewInTheaters()
                print("New in theaters!")
            }
            tableView.reloadData()
        } else if (segmentedControl.selectedSegmentIndex == 1) {
            if (!newDVDsLoaded) {
                newDvds.removeAll()
                tableView.reloadData()
                getNewDVDs()
                print("New DVD's!")
            }
            tableView.reloadData()
        }
    }
    
    @IBAction func reloadPressed(sender: UIBarButtonItem) {
        if (segmentedControl.selectedSegmentIndex == 0) {
            newInTheatersMovies.removeAll()
            tableView.reloadData()
            getNewInTheaters()
            print("New in theaters!")
        } else if (segmentedControl.selectedSegmentIndex == 1) {
            newDvds.removeAll()
            tableView.reloadData()
            getNewDVDs()
            print("New DVD's!")
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath) as! MovieCell
        
        switch(segmentedControl.selectedSegmentIndex) {
        case 0:
            let movie = newInTheatersMovies[indexPath.row]
            cell.movie = movie
            break
            
        case 1:
            let movie = newDvds[indexPath.row]
            cell.movie = movie
            break
            
        default:
            break
        }
        return cell
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnValue = 0
        switch(segmentedControl.selectedSegmentIndex) {
        case 0:
            returnValue = newInTheatersMovies.count
            break
            
        case 1:
            returnValue = newDvds.count
            break
            
        default:
            break
        }
        return returnValue
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("MovieDetail", sender: self)
    }
    
    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("segue!")
        if segue.identifier == "MovieDetail" {
            print("segue!")
            let destinationVC = segue.destinationViewController as! MovieViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                if segmentedControl.selectedSegmentIndex == 0 {
                    destinationVC.movie = newInTheatersMovies[indexPath.row]
                    destinationVC.title = newInTheatersMovies[indexPath.row].title
                    print(newInTheatersMovies[indexPath.row].title)
                } else if segmentedControl.selectedSegmentIndex == 1 {
                    destinationVC.movie = newDvds[indexPath.row]
                    destinationVC.title = newDvds[indexPath.row].title
                    print(newDvds[indexPath.row].title)
                }
            }
        }
    }

    
    
    func getNewInTheaters() {
        let url = Constants.newInTheatersURL
        print(url)
        Alamofire.request(.GET, url).validate().responseJSON { response in
            switch response.result {
            case .Success:
                self.newInTheatersLoaded = true
                if let value = response.result.value {
                    var res = JSON(value)
                    let total = Int(String(res["total"]))!
                    print(total)
                    if (total > 0) {
                        if total >= 15 {
                            for i in 0...14 {
                                if let title = res["movies"][i]["title"].string {
                                    let year = String(res["movies"][i]["year"])
                                    let mpaa_rating = res["movies"][i]["mpaa_rating"].string
                                    let thumbnail = res["movies"][i]["posters"]["thumbnail"].string?.urlToImg()
                                    let movie = Movie(title: title, mpaa_rating: mpaa_rating!, year: year, thumbnail: thumbnail)
                                    self.newInTheatersMovies.append(movie)
                                    print(title)
                                    print(year)
                                }
                            }
                            self.tableView.reloadData()
                        } else {
                            for i in 0...total - 1 {
                                if let title = res["movies"][i]["title"].string {
                                    let year = String(res["movies"][i]["year"])
                                    print(year)
                                    let mpaa_rating = res["movies"][i]["mpaa_rating"].string
                                    print(mpaa_rating)
                                    let thumbnail = res["movies"][i]["posters"]["thumbnail"].string?.urlToImg()
                                    let movie = Movie(title: title, mpaa_rating: mpaa_rating!, year: year, thumbnail: thumbnail)
                                    self.newInTheatersMovies.append(movie)
                                    print(title)
                                    print(year)
                                }
                            }
                            self.tableView.reloadData()
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
    
    func getNewDVDs() {
        let url = Constants.newDVDsURL
        print(url)
        Alamofire.request(.GET, url).validate().responseJSON { response in
            switch response.result {
            case .Success:
                self.newDVDsLoaded = true
                if let value = response.result.value {
                    var res = JSON(value)
                    let total = Int(String(res["total"]))!
                    print(total)
                    if (total > 0) {
                        if total >= 15 {
                            for i in 0...14 {
                                if let title = res["movies"][i]["title"].string {
                                    let year = String(res["movies"][i]["year"])
                                    let mpaa_rating = res["movies"][i]["mpaa_rating"].string
                                    let thumbnail = res["movies"][i]["posters"]["thumbnail"].string?.urlToImg()
                                    let movie = Movie(title: title, mpaa_rating: mpaa_rating!, year: year, thumbnail: thumbnail)
                                    self.newDvds.append(movie)
                                    print(title)
                                    print(year)
                                }
                            }
                            self.tableView.reloadData()
                        } else {
                            for i in 0...total - 1 {
                                if let title = res["movies"][i]["title"].string {
                                    let year = String(res["movies"][i]["year"])
                                    print(year)
                                    let mpaa_rating = res["movies"][i]["mpaa_rating"].string
                                    print(mpaa_rating)
                                    let thumbnail = res["movies"][i]["posters"]["thumbnail"].string?.urlToImg()
                                    let movie = Movie(title: title, mpaa_rating: mpaa_rating!, year: year, thumbnail: thumbnail)
                                    self.newDvds.append(movie)
                                    print(title)
                                    print(year)
                                }
                            }
                            self.tableView.reloadData()
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