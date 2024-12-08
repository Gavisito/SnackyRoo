//
//  SnackViewController.swift
//  SnackyRoo
//this App is developed as an educational project
//  Created by Anthony Gavidia-Vasquez on 10/27/24.
//this App is developed as an educational project
//certain materials are included under the fair use exemption of the U.S. Copyright Law
//and have been prepared according to the multimedia fair use guidelines and are restricted from further
//use

import Foundation
import UIKit
import AVFoundation

class SnackViewController: UIViewController{
    
    @IBOutlet weak var snackNameLBL: UILabel!
    
    @IBOutlet weak var snackPriceLBL: UILabel!
    
    @IBOutlet weak var snackDescLBL: UITextView!
    
    @IBOutlet weak var snackIMG: UIImageView!
    
    @IBOutlet weak var buyButton: UIButton!
    
    @IBOutlet weak var descLBL: UILabel!
    
    var mySoundsFiles = AVAudioPlayer()
    
    var snackArray = [snackModel]()
    
    var snackData = snackModel()
    
    //open the snack website link
    @IBAction func buyButton(_ sender: Any) {
        let browser = UIApplication.shared
        let url = URL(string:  snackData.snackWesbite)
        mySoundsFiles.play()
        browser.open(url!)
    }
    
    func PullImage(imagePath: String) -> UIImage {
        var downloadedImage =  UIImage()
        
        let imgurl = URL(string: imagePath)
        let imgBytes = try? Data(contentsOf: imgurl!)
        print(imgBytes ?? "Error")
        downloadedImage = UIImage(data:imgBytes!)!
        return downloadedImage
    }

    func labelData(){
        //snackData = snackArray.randomElement()!
        snackNameLBL.text = snackData.snackName
        snackPriceLBL.text = snackData.snackPrice
        snackDescLBL.text = snackData.snackDescription
        snackIMG.image = PullImage(imagePath: snackData.snackIMG)
    }
    
    func insertData(){
        let sd1 = snackModel()
        sd1.snackName = "Marinela Gansito"
        sd1.snackPrice = "$3.58"
        sd1.snackDescription = "Marinela Gansitio is a famous latino snacks children have grown up with. This snack is sort of like a miz betwen cookie and mini cake. IT has chocolote, cream, various types of filling, but this one contains strawberry! If you want a good introductry snack into latino culture, then this a good option!"
        sd1.snackWesbite = "https://www.walmart.com/ip/Marinela-Gansito-Strawberry-and-Cr-me-Filled-Snack-Cookies-with-Chocolate-Coating-Artificially-Flavored-10-Count/27147035?classType=REGULAR"
        sd1.snackIMG = "Marinela-Gansito.webp"
        //image comes from this walmart link above
        //Marinela. (n.d.). Marinela Gansito. Walmart. https://www.walmart.com/ip/Marinela-Gansito-Strawberry-and-Cr-me-Filled-Snack-Cookies-with-Chocolate-Coating-Artificially-Flavored-10-Count/27147035?classType=REGULAR
        snackArray.append(sd1)
        
        let sd2 = snackModel()
        sd2.snackName = "Marinela Sponch Marshmallow Cookies"
        sd2.snackPrice = "$3.58"
        sd2.snackDescription = "Another product by Marinela!! This is very innteresting snack when I first tried it. It definetely a hit or miss for some people. It contains plain marshamellow and strawberry flavored marshmellow; coconut shaving, adn strawberry cream on top. "
        sd2.snackWesbite = "https://www.walmart.com/ip/Marinela-Sponch-Marshmallow-Cookies-4-count-12-68-oz/10403499?classType=REGULAR"
        sd2.snackIMG = "Marinela-Sponch-Marshmallow-Cookies.webp"
        //image comes from this wALmart link above
        //Marinela. (n.d.). Marinela-Sponch-Marshmallow-Cookies. Walmart.https://www.walmart.com/ip/Marinela-Sponch-Marshmallow-Cookies-4-count-12-68-oz/10403499?classType=REGULAR
        snackArray.append(sd2)
        
        let sd3 = snackModel()
        sd3.snackName = "Empanadas"
        sd3.snackPrice = "Varies ($2.49)"
        sd3.snackDescription = "Now, this can be considered a meal on its own right; however, in restaurants, this is uaully served as a snack or appetetizers. In the image I cooked those. It contains beef; sweet potatoes, carrots; and various spices to enhance its flavour!"
        sd3.snackWesbite = "https://aroma-holdings.com/aroma-express/#menu"
        sd3.snackIMG = "empanadas.jpeg"
        //image comes from myself when baked empanadas in the summer
        snackArray.append(sd3)
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            //complete transaprancy to start the animation when shaking the phone
            snackDescLBL.alpha = 0
            snackNameLBL.alpha = 0
            snackPriceLBL.alpha = 0
            buyButton.alpha = 0
            descLBL.alpha = 0
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
                UIView.animate(withDuration: 2, animations: {
                //changes the view background color for dark mode
                self.view.layer.backgroundColor = UIColor.black.cgColor
                
                //animation for light to dark mode opacity
                self.snackIMG.alpha = 1
                self.snackDescLBL.alpha = 1
                self.snackNameLBL.alpha = 1
                self.snackPriceLBL.alpha = 1
                self.buyButton.alpha = 1
                self.descLBL.alpha = 1
                
                //changes text color for dark mode
                self.snackDescLBL.textColor = UIColor.white
                self.snackDescLBL.layer.backgroundColor = UIColor.black.cgColor
                self.descLBL.textColor = UIColor.white
                self.snackNameLBL.textColor = UIColor.white
                self.snackPriceLBL.textColor = UIColor.white
            })
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        //Myinstants. (n.d.-b). Success chime - sound button. myinstants. https://www.myinstants.com/en/instant/success-chime-49738/
        let soundURL = URL(fileURLWithPath: Bundle.main.path(forResource: "success-chime", ofType: "mp3")!)
        mySoundsFiles = try!AVAudioPlayer(contentsOf: soundURL)
        //insertData()
        labelData()
    }
}
