//
//  ProfileViewController.swift
//  Buzz Movie Selector
//
//  Created by Alejandrina Patron on 4/20/16.
//  Copyright © 2016 Ale Patrón. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let user = User(name: "Ale Patron", username: "ale_patron", password: "tech", profilePicture: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
