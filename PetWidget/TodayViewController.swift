//
//  TodayViewController.swift
//  PetWidget
//
//  Created by 王巍 on 3/25/17.
//  Copyright © 2017 王巍. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var dog: UIImageView!
    @IBOutlet weak var cat: UIImageView!
    @IBOutlet weak var bird: UIImageView!
    @IBOutlet weak var bunny: UIImageView!
    @IBOutlet weak var fish: UIImageView!
 
    @IBOutlet weak var dogh: UILabel!
    @IBOutlet weak var cath: UILabel!
    @IBOutlet weak var birdh: UILabel!
    @IBOutlet weak var bunnyh: UILabel!
    @IBOutlet weak var fishh: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        dog.image = UIImage.init(named: "dog@2x.png")
        cat.image = UIImage.init(named: "cat@2x.png")
        bird.image = UIImage.init(named: "bird@2x.png")
        bunny.image = UIImage.init(named: "bunny@2x.png")
        fish.image = UIImage.init(named: "fish@2x.png")
        if let doghappy = UserDefaults.init(suiteName: "group.ww.todayextension")?.value(forKey: "dog"){
            dogh.text = String(describing: doghappy)
        }else{
            dogh.text = "0"
        }
        if let cathappy = UserDefaults.init(suiteName: "group.ww.todayextension")?.value(forKey: "cat"){
            cath.text = String(describing: cathappy)
        }else{
            cath.text = "0"
        }
        if let birdhappy = UserDefaults.init(suiteName: "group.ww.todayextension")?.value(forKey: "bird"){
            birdh.text = String(describing: birdhappy)
        }else{
            birdh.text = "0"
        }
        if let bunnyhappy = UserDefaults.init(suiteName: "group.ww.todayextension")?.value(forKey: "bunny"){
            bunnyh.text = String(describing: bunnyhappy)
        }else{
            bunnyh.text = "0"
        }
        if let fishhappy = UserDefaults.init(suiteName: "group.ww.todayextension")?.value(forKey: "fish"){
            fishh.text = String(describing: fishhappy)
        }else{
            fishh.text = "0"
        }

        
        
        
       
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {

        if let doghappy = UserDefaults.init(suiteName: "group.ww.todayextension")?.value(forKey: "dog"){
            if( String(describing: doghappy) != dogh.text ){
                dogh.text = String(describing: doghappy)
                completionHandler(NCUpdateResult.newData)
            }else{
                completionHandler(NCUpdateResult.noData)
            }
        }else{
            dogh.text = "0"
            completionHandler(NCUpdateResult.newData)
        }
        
        if let cathappy = UserDefaults.init(suiteName: "group.ww.todayextension")?.value(forKey: "cat"){
            if( String(describing: cathappy) != cath.text ){
                cath.text = String(describing: cathappy)
                completionHandler(NCUpdateResult.newData)
            }else{
                completionHandler(NCUpdateResult.noData)
            }
        }else{
            cath.text = "0"
            completionHandler(NCUpdateResult.newData)
        }

        if let bunnyhappy = UserDefaults.init(suiteName: "group.ww.todayextension")?.value(forKey: "bunny"){
            if( String(describing: bunnyhappy) != bunnyh.text ){
                bunnyh.text = String(describing: bunnyhappy)
                completionHandler(NCUpdateResult.newData)
            }else{
                completionHandler(NCUpdateResult.noData)
            }
        }else{
            bunnyh.text = "0"
            completionHandler(NCUpdateResult.newData)
        }
        
        if let birdhappy = UserDefaults.init(suiteName: "group.ww.todayextension")?.value(forKey: "bird"){
            if( String(describing: birdhappy) != birdh.text ){
                birdh.text = String(describing: birdhappy)
                completionHandler(NCUpdateResult.newData)
            }else{
                completionHandler(NCUpdateResult.noData)
            }
        }else{
            birdh.text = "0"
            completionHandler(NCUpdateResult.newData)
        }
        
        if let fishhappy = UserDefaults.init(suiteName: "group.ww.todayextension")?.value(forKey: "fish"){
            if( String(describing: fishhappy) != fishh.text ){
                fishh.text = String(describing: fishhappy)
                completionHandler(NCUpdateResult.newData)
            }else{
                completionHandler(NCUpdateResult.noData)
            }
        }else{
            fishh.text = "0"
            completionHandler(NCUpdateResult.newData)
        }
        
    }
    
}
