//
//  Utils.swift
//  Buzz Movie Selector
//
//  Created by Alejandrina Patron on 4/21/16.
//  Copyright © 2016 Ale Patrón. All rights reserved.
//

import UIKit

extension String {
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    
    func urlToImg() -> UIImage? {
        let url = NSURL(string: self)
        if let data = NSData(contentsOfURL: url!) {
            return UIImage(data: data)
        }
        return nil
    }
}