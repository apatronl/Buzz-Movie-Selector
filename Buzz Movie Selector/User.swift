//
//  User.swift
//  Buzz Movie Selector
//
//  Created by Alejandrina Patron on 4/23/16.
//  Copyright © 2016 Ale Patrón. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    var name: String
    var username: String
    var password: String
    var profilePicture: UIImage?
    
    init (name: String, username: String, password: String, profilePicture: UIImage?) {
        self.name = name
        self.username = username
        self.password = password
        if let unwrapperPhoto = profilePicture {
            self.profilePicture = unwrapperPhoto
        }
    }
}