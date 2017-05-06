//
//  ViewController.swift
//  VirtualPet
//
//  Created by 王巍 on 2/5/17.
//  Copyright © 2017 王巍. All rights reserved.
//

import UIKit
import AudioToolbox


class ViewController: UIViewController {
    var pet:actionButton!{
        didSet{
            viewUpdate()
        }
    }
    var theSound: SystemSoundID!
    var timer: Timer?
    
    var dogh = 0
    var dogf = 0
    var cath = 0
    var catf = 0
    var fishh = 0
    var fishf = 0
    var bunnyh = 0
    var bunnyf = 0
    var birdh = 0
    var birdf = 0
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var petimage: UIImageView!
    @IBOutlet weak var happynumber: UILabel!
    @IBOutlet weak var foodnumber: UILabel!
    @IBOutlet weak var happiness: DisplayView!
    @IBOutlet weak var foodlevel: DisplayView!
    
    
    func createSound(pet: String) -> SystemSoundID {
        var soundID: SystemSoundID = 0
        let soundURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), "\(pet)" as CFString!, "wav" as CFString!, nil)
        AudioServicesCreateSystemSoundID(soundURL!, &soundID)
        return soundID
    }
    
    @IBAction func play(_ sender: Any) {
        
        switch String(describing: pet.pet){
            case "dog":
            (dogh, dogf) = pet.play()
            theSound = createSound(pet: "dog")
            case "cat":
            (cath, catf) = pet.play()
            theSound = createSound(pet: "cat")
            case "bird":
            (birdh, birdf) = pet.play()
            theSound = createSound(pet: "bird")
            case "fish":
            (fishh, fishf) = pet.play()
            theSound = createSound(pet: "fish")
            case "bunny":
            (bunnyh, bunnyf) = pet.play()
            theSound = createSound(pet: "bunny")
        default:
            print("Impossible")
        }
        AudioServicesPlaySystemSound(theSound)
        viewUpdate()
    }
    @IBAction func feed(_ sender: Any) {
        switch String(describing: pet.pet){
        case "dog":
            dogf = pet.feed()
        case "cat":
            catf = pet.feed()
        case "bird":
            birdf = pet.feed()
        case "fish":
            fishf = pet.feed()
        case "bunny":
            bunnyf = pet.feed()
        default:
            print("Impossible")
        }
        viewUpdate()
    }
    func happinessDecrease(){
        timer?.invalidate()
        timer = nil
        timer = Timer(timeInterval: 5.0, target: self, selector: #selector(unhappy), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode:RunLoopMode.commonModes)
    }
    
    func unhappy(){
        if pet.happiness > 0{
            pet.happiness -= 1
            switch String(describing: pet.pet){
            case "dog":
                dogh -= 1
            case "cat":
                cath -= 1
            case "bird":
                birdh -= 1
            case "fish":
                fishh -= 1
            case "bunny":
                bunnyh -= 1
            default:
                print("Impossible")
            }
            viewUpdate()
        }
    }
    
    @IBAction func dog(_ sender: Any) {
        petimage.image = UIImage.init(named: "dog.png")
        background.backgroundColor = UIColor.blue
        happiness.color = UIColor.blue
        foodlevel.color = UIColor.blue
        happinessDecrease()
        pet = actionButton(pet: .dog, h: dogh, f: dogf)
        
    }
    @IBAction func cat(_ sender: Any) {
        petimage.image = UIImage.init(named: "cat.png")
        background.backgroundColor = UIColor.red
        happiness.color = UIColor.red
        foodlevel.color = UIColor.red
        happinessDecrease()
        pet = actionButton(pet: .cat, h: cath, f: catf)
    }
    @IBAction func bird(_ sender: Any) {
        petimage.image = UIImage.init(named: "bird.png")
        background.backgroundColor = UIColor.yellow
        happiness.color = UIColor.yellow
        foodlevel.color = UIColor.yellow
        happinessDecrease()
        pet = actionButton(pet: .bird, h: birdh, f: birdf)
    }
    @IBAction func bunny(_ sender: Any) {
        petimage.image = UIImage.init(named: "bunny.png")
        background.backgroundColor = UIColor.green
        happiness.color = UIColor.green
        foodlevel.color = UIColor.green
        happinessDecrease()
        pet = actionButton(pet: .bunny, h: bunnyh, f: bunnyf)
    }
    @IBAction func fish(_ sender: Any) {
        petimage.image = UIImage.init(named: "fish.png")
        background.backgroundColor = UIColor.cyan
        happiness.color = UIColor.cyan
        foodlevel.color = UIColor.cyan
        happinessDecrease()
        pet = actionButton(pet: .fish, h: fishh, f: fishf)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set the initial view to cat
        
        petimage.image = UIImage.init(named: "cat.png")
        background.backgroundColor = UIColor.red
        happiness.color = UIColor.red
        foodlevel.color = UIColor.red
        happinessDecrease()
        pet = actionButton(pet: .cat, h: cath, f: catf)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewUpdate(){
        happynumber.text = "Played:" + String(pet.happiness)
        foodnumber.text = "Fed:" + String(pet.foodLevel)
        let foodbar = CGFloat(pet.foodLevel)/10
        foodlevel.animateValue(to: foodbar)
        let happybar = CGFloat(pet.happiness)/10
        happiness.animateValue(to: happybar)
        UserDefaults.init(suiteName: "group.ww.todayextension")?.setValue(dogh, forKey: "dog")
        UserDefaults.init(suiteName: "group.ww.todayextension")?.setValue(cath, forKey: "cat")
        UserDefaults.init(suiteName: "group.ww.todayextension")?.setValue(birdh, forKey: "bird")
        UserDefaults.init(suiteName: "group.ww.todayextension")?.setValue(bunnyh, forKey: "bunny")
        UserDefaults.init(suiteName: "group.ww.todayextension")?.setValue(fishh, forKey: "fish")
    }


}

