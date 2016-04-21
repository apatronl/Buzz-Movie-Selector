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
    
    var name: String
    var thumbnail: UIImage?
    var year: String
    
    init(name: String, thumbnail: UIImage?, year: String) {
        self.name = name
        self.thumbnail = thumbnail
        self.year = year
    }
    
}