//
//  MovieViewController.swift
//  Buzz Movie Selector
//
//  Created by Alejandrina Patron on 4/23/16.
//  Copyright © 2016 Ale Patrón. All rights reserved.
//

import UIKit
import SafariServices

class MovieViewController: UIViewController {
    
    var movie: Movie?
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var playTrailerButton: UIButton!
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var mpaa_rating: UILabel!
    @IBOutlet weak var synopsis: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        rateButton.layer.borderWidth = 0.3
        playTrailerButton.layer.borderWidth = 0.3
        rateButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        playTrailerButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        thumbnail.image = movie!.thumbnail
        movieTitle.text = movie!.title
        year.text = movie!.year
        mpaa_rating.text = movie!.mpaa_rating
        synopsis.text = movie!.synopsis
    }
    
    @IBAction func playTrailer(sender: UIButton) {
        let safari = SFSafariViewController(URL: NSURL(string: (movie?.trailer)!)!)
        safari.view.tintColor = UIColor(red: 253.0/255.0, green: 184.0/255.0, blue: 19.0/255.0, alpha: 1.0)
        presentViewController(safari, animated: true, completion: nil)
    }
    
    @IBAction func shareMovie(sender: UIBarButtonItem) {
        let activityItems: [AnyObject] = ["I found this movie on Buzz Movie Selector: " + movie!.title]
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        activityViewController.view.tintColor = UIColor(red: 253.0/255.0, green: 184.0/255.0, blue: 19.0/255.0, alpha: 1.0)
        presentViewController(activityViewController, animated: true, completion: {})
    }
}
