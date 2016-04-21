//
//  Constants.swift
//  Buzz Movie Selector
//
//  Created by Alejandrina Patron on 4/21/16.
//  Copyright © 2016 Ale Patrón. All rights reserved.
//

import Foundation

struct Constants {
    static let apiKey = "yedukp76ffytfuy24zsqk7f5"
    
    static let rotten = "http://api.rottentomatoes.com/api/public/v1.0/"
    
    static let searchURL = rotten + "movies.json?apikey=" + apiKey
    
}

extension String {
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
}
