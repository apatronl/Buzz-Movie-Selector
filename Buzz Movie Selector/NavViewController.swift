//
//  NavViewController.swift
//  Buzz Movie Selector
//
//  Created by Alejandrina Patron on 4/20/16.
//  Copyright © 2016 Ale Patrón. All rights reserved.
//

import UIKit

class NavViewController: UINavigationController {
    
    override func viewDidLoad() {
        let myNavBarColor: UIColor = UIColor(red: 253.0/255.0, green: 184.0/255.0, blue: 19.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().barTintColor = myNavBarColor
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        
        UITabBar.appearance().backgroundColor = myNavBarColor
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func  preferredStatusBarStyle()-> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
