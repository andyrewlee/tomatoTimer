//
//  ViewController.swift
//  tomatoTimer
//
//  Created by Jae Hoon Lee on 8/8/15.
//  Copyright © 2015 Jae Hoon Lee. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var timer = NSTimer()
    var timeLeft = 1500
    var timeStopped = false
    

    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var timeTextField: NSTextField!
    
    @IBAction func tomatoButtonPressed(sender: NSButton) {
        timeStopped = false
        stopButton.title = "Stop"
        timeLeft = 1500
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateUI", userInfo: nil, repeats: true)
    }
    
    @IBAction func breakButtonPressed(sender: NSButton) {
        timeStopped = false
        stopButton.title = "Stop"
        timeLeft = 300
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateUI", userInfo: nil, repeats: true)
    }
    
    @IBAction func stopButtonPressed(sender: NSButton) {
        
        if timeStopped {
            sender.title = "Stop"
            timeStopped = false
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateUI", userInfo: nil, repeats: true)
        } else {
            timer.invalidate()
            timeStopped = true
            sender.title = "Start"
            timeStopped = true
            timer.invalidate()
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func updateUI() {
        timeLeft -= 1
        
        var currentTime = timeLeft
        
        let minutes = Int(currentTime/60)
        currentTime -= minutes * 60
        let seconds = Int(currentTime)
        
        let strMinutes = minutes > 9 ? String(minutes): "0" + String(minutes)
        let strSeconds = seconds > 9 ? String(seconds): "0" + String(seconds)
        
        timeTextField.stringValue = "\(strMinutes):\(strSeconds)"

    }
}

