//
//  Movie.swift
//  Buzz Movie Selector
//
//  Created by Alejandrina Patron on 4/21/16.
//  Copyright © 2016 Ale Patrón. All rights reserved.
//

import Foundation
import UIKit

class Movie {
    
    var title: String
    var year: String
    var mpaa_rating: String
    var thumbnail: UIImage?
    var trailer: String
    var synopsis: String
    
    init(title: String, mpaa_rating: String, year: String, thumbnail: UIImage?, trailer: String, synopsis: String) {
        self.title = title
        self.mpaa_rating = mpaa_rating
        self.year = year
        if let theThumbnail = thumbnail {
            self.thumbnail = theThumbnail
        }
        self.trailer = trailer
        self.synopsis = synopsis
    }
}