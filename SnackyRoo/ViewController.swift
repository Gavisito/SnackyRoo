//
//  ViewController.swift
//  SnackyRoo
//
//  Created by Anthony Gavidia-Vasquez on 10/27/24.
//this App is developed as an educational project
//certain materials are included under the fair use exemption of the U.S. Copyright Law
//and have been prepared according to the multimedia fair use guidelines and are restricted from further
//use
// This is a tutorial i found that helped me navigate between views using storyboard buttons https://www.youtube.com/watch?v=4punui8fovE
//I also reference some code for the sound and randomelement of the hiking trail app

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //when the user click on the start button to switch to snackviewcontroller
    var mySoundsFiles = AVAudioPlayer()
    @IBAction func startButton(_ sender: Any) {
        mySoundsFiles.play()
    }
    
    //when the app load up it play a chime
    func loadSound(){
        mySoundsFiles.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //links to the sound: https://www.myinstants.com/en/instant/effects-chime-34650/
        //Myinstants. (n.d.). Effects chime - sound button. myinstants. https://www.myinstants.com/en/instant/effects-chime-34650/
        let soundURL = URL(fileURLWithPath: Bundle.main.path(forResource: "after-effects-chime", ofType: "mp3")!)
        mySoundsFiles = try!AVAudioPlayer(contentsOf: soundURL)
        loadSound()
    }


}

