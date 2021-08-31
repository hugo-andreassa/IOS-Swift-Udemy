//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerProgressView: UIProgressView!
    
    var eggTime = ["Soft": 300, "Medium": 420, "Hard": 720]
    var timer: Timer?
    var totalTime: Float = 0.0
    var secondsPassed: Float = 0.0
    var secondsRemaining = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        if let seconds = eggTime[hardness] {
            
            timer?.invalidate()
            
            secondsRemaining = seconds
            totalTime = Float(seconds)
            
            timer = Timer.scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector(updateTimer),
                userInfo: nil,
                repeats: true)
        }
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            timerProgressView.progress = secondsPassed / totalTime
            secondsPassed += 1
        }
        
        if secondsRemaining >= 0 {
            timerLabel.text = "\(String(secondsRemaining)) seconds."
            secondsRemaining -= 1
        } else {
            timer?.invalidate()
        }
    }
}
