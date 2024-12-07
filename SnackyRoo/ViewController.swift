//
//  ViewController.swift
//  SnackyRoo
//
//  Created by Anthony Gavidia-Vasquez on 10/27/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //when the user click on the start button to switch to snackviewcontroller
    var mySoundsFiles = AVAudioPlayer()
    @IBAction func startButton(_ sender: Any) {
        mySoundsFiles.play()
    }
    //when the app load up
    func loadSound(){
        mySoundsFiles.play()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //links to the sound: https://www.myinstants.com/en/instant/effects-chime-34650/
        let soundURL = URL(fileURLWithPath: Bundle.main.path(forResource: "after-effects-chime", ofType: "mp3")!)
        mySoundsFiles = try!AVAudioPlayer(contentsOf: soundURL)
        loadSound()
    }


}

