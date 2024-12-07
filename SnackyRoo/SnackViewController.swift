//
//  SnackViewController.swift
//  SnackyRoo
//
//  Created by Anthony Gavidia-Vasquez on 10/27/24.
//

import Foundation
import UIKit
import AVFoundation

class SkyViewController: UIViewController{
    
    @IBOutlet weak var snackNameLBL: UILabel!
    
    @IBOutlet weak var snackPriceLBL: UILabel!
    
    @IBOutlet weak var snackDescLBL: UITextView!
    
    @IBOutlet weak var snackIMG: UIImageView!
    
    var mySoundsFiles = AVAudioPlayer()
    
    var snackArray = [snackModel]()
    
    var snackData = snackModel()
    
    @IBAction func buyButton(_ sender: Any) {
        let browser = UIApplication.shared
        let url = URL(string:  snackData.snackWesbite)
        mySoundsFiles.play()
        browser.open(url!)
    }

    @IBAction func randomizeButton(_ sender: Any) {
        labelData()
        mySoundsFiles.play()
    }
    
    func labelData(){
        snackData = snackArray.randomElement()!
        snackNameLBL.text = snackData.snackName
        snackPriceLBL.text = snackData.snackPrice
        snackDescLBL.text = snackData.snackDescription
        snackIMG.image = UIImage(named: snackData.snackIMG)
    }
    
    func insertData(){
        let sd1 = snackModel()
        sd1.snackName = "Marinela Gansito"
        sd1.snackPrice = "$3.58"
        sd1.snackDescription = ""
        sd1.snackWesbite = "https://www.walmart.com/ip/Marinela-Gansito-Strawberry-and-Cr-me-Filled-Snack-Cookies-with-Chocolate-Coating-Artificially-Flavored-10-Count/27147035?classType=REGULAR"
        sd1.snackIMG = ""
        //image comes from this walmart link above
        snackArray.append(sd1)
        
        let sd2 = snackModel()
        sd2.snackName = "Marinela Sponch Marshmallow Cookies"
        sd2.snackPrice = "$3.58"
        sd2.snackDescription = ""
        sd2.snackWesbite = "https://www.walmart.com/ip/Marinela-Sponch-Marshmallow-Cookies-4-count-12-68-oz/10403499?classType=REGULAR"
        sd2.snackIMG = ""
        //image comes from this wlamart link above
        snackArray.append(sd2)
        
        let sd3 = snackModel()
        sd3.snackName = "Empanadas"
        sd3.snackPrice = "Varies ($2.49)"
        sd3.snackDescription = ""
        sd3.snackWesbite = "https://aroma-holdings.com/aroma-express/#menu"
        sd3.snackIMG = ""
        //image comes from myself when baked empanadas in the summer
        snackArray.append(sd3)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //link to the sound: https://www.myinstants.com/en/instant/success-chime-49738/
        let soundURL = URL(fileURLWithPath: Bundle.main.path(forResource: "success-chime", ofType: "mp3")!)
        mySoundsFiles = try!AVAudioPlayer(contentsOf: soundURL)
        insertData()
        labelData()
    }
}
