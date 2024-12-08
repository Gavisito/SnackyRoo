//
//  ReminderViewController.swift
//  SnackyRoo
//
//  Created by Anthony Gavidia-Vasquez on 10/27/24.
//this App is developed as an educational project
//certain materials are included under the fair use exemption of the U.S. Copyright Law
//and have been prepared according to the multimedia fair use guidelines and are restricted from further
//use
//citation
//Apple. (n.d.). Timer. Apple Developer Documentation. https://developer.apple.com/documentation/foundation/timer
// Basic Tutorial I also followed for bare bones set up such as timer function then afterwards worked on my customize from this point on: https://www.youtube.com/watch?v=eizL0nYTfTY

import Foundation
import UIKit
import AVFoundation

class TimerViewController: UIViewController{
    
    //the clock display
    @IBOutlet weak var timeClock: UILabel!
    
    //text fields from the reminder page
    @IBOutlet weak var hours: UITextField!
    @IBOutlet weak var minutes: UITextField!
    @IBOutlet weak var seconds: UITextField!
    
    //sound play
    var mySoundsFiles = AVAudioPlayer()
    
    //calling timer function
    var timer = Timer()
    
    //initalizing variables. Especially for initial display with countdown (0:0:0)
    var totalAmountTime = 0
    var sethour = 0
    var setminutes = 0
    var setseconds = 0
    
    @IBAction func startReminder(_ sender: Any) {
        timer.invalidate() //whenever the button gets pressed it will stop the previous countdown and start fresh
        
        //when null itll place 0. ?? were placed by swift for build for preventing nil occurance
        //these convert the text field input into integers
        sethour = Int(hours.text ?? "0") ?? 0
        setminutes = Int(minutes.text ?? "0") ?? 0
        setseconds = Int(seconds.text ?? "0") ?? 0
        
        //adding up all the values based on text field input. Converted value in seconds for the Timer() to understand to do reverse conversion in upcomingREminder count down
        totalAmountTime = (sethour * 3600) + (setminutes * 60) + (setseconds)
        
        //this sets up the timer to call the upcomingReminder function in the #selector call and counts by one
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(upcomingReminder), userInfo: nil, repeats: true)
        //Apple. (n.d.). Timer. Apple Developer Documentation. https://developer.apple.com/documentation/foundation/timer
    }
    
    //this does the main work for the clock counting down by the second
    //alsodoes some display conversion for hours minutes and seconds.
    //@objc auto fix
    @objc func upcomingReminder(){
        //foramtting the hours, minutes, seconds properly
        sethour = totalAmountTime / 3600
        setminutes = (totalAmountTime % 3600 ) / 60
        setseconds = totalAmountTime % 60
        if totalAmountTime > 0 { //when above 0 seconds itll keep counting down
            totalAmountTime -= 1
            
            //clock formating
            timeClock.text = "\(sethour)" + " : " + "\(setminutes)" + " : " + "\(setseconds)"//how it display the values respectively
        }
        else{ //this is conditional necessary to stop the timer fucntion since it will continue into the negatives as ive seen.
            timeClock.text = "Snack Time!!!"
            mySoundsFiles.play() //alarm
            timer.invalidate() //stop the clock when it finsihed
        }
    }
    
    //just border styling
    func clockborder(){
        timeClock.layer.borderWidth = 2
        timeClock.layer.cornerRadius = 15
        timeClock.layer.borderColor = UIColor.black.cgColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //displaing clock as (0:0:0) to start
        timeClock.text = "\(sethour)" + " : " + "\(setminutes)" + " : " + "\(setseconds)"
        clockborder() //initalize styling
        
        //set up the alarm here
        let soundURL = URL(fileURLWithPath: Bundle.main.path(forResource: "reminderAlarm", ofType: "mp3")!)
        mySoundsFiles = try!AVAudioPlayer(contentsOf: soundURL)
    }
}
