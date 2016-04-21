//
//  MovieCell.swift
//  Buzz Movie Selector
//
//  Created by Alejandrina Patron on 4/21/16.
//  Copyright © 2016 Ale Patrón. All rights reserved.
//

import Foundation
import UIKit

class MovieCell: UITableViewCell {
    
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var mpaa_rating: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    var movie: Movie! {
        didSet {
            title.text = movie.title
            year.text = movie.year
            mpaa_rating.text = movie.mpaa_rating
            thumbnail.contentMode = UIViewContentMode.ScaleAspectFill
            thumbnail.clipsToBounds = true
            thumbnail.image = movie.thumbnail
        }
    }
    
}
