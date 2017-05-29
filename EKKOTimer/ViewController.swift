//
//  ViewController.swift
//  EKKOTimer
//
//  Created by Erika Cheung on 4/30/17.
//  KEVIN YIN WAS HERE TO FIX EVERYTHING AND DO STUFF
//  Copyright © 2017 Kevin Yin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var startTimer: UIButton!
    @IBOutlet weak var pauseTimer: UIButton!
    @IBOutlet weak var timer_display: UILabel!
    
    var seconds = 60
    var timer = Timer()
    var timer_running = false
    var timer_status = false
    
    @IBAction func Start_Timer(_ sender: UIButton) {
        if self.timer_running == false {
            init_timer()
            self.startTimer.isEnabled = false
        }
        
    }
    
    func init_timer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.update_timer)), userInfo: nil, repeats: true)
        self.pauseTimer.isEnabled = true
    }
    
    @IBAction func Pause_Timer(_ sender: UIButton) {
        if self.timer_status == false {
            timer.invalidate()
            self.timer_status = true
            self.pauseTimer.setTitle("Resume", for: .normal)
        } else {
            init_timer()
            self.timer_status = false
            self.pauseTimer.setTitle("Pause", for: .normal)
        }
        
    }
    
    @IBAction func reset_Timer(_ sender: UIButton) {
        timer.invalidate()
        seconds = 60
        timer_display.text = timeString(time: TimeInterval(seconds))
        pauseTimer.isEnabled = false
        startTimer.isEnabled = true
        timer_running = false
        self.pauseTimer.setTitle("Pause", for: .normal)
    }
    
    func update_timer() {
        if seconds < 1 {
            timer.invalidate()
        } else {
        seconds -= 1
        timer_display.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }

    
    
    
//
//    @IBOutlet weak var timerLabel: UILabel!
//    
//    var seconds = 60
//    var timer = Timer()
//    var isTimerRunning = false
//    var resumeTapped = false
//    
//    @IBAction func startButtonTapped(_ sender: UIButton)  {
//        runTimer()
//    }
//    
//    func runTimer() {
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
//    }
//    
//    @IBAction func pauseButtonTapped(_ sender: UIButton) {
//        if self.resumeTapped == false {
//            timer.invalidate()
//            self.resumeTapped = true
//        } else {
//            runTimer()
//            self.resumeTapped = false
//        }
//    }
//    @IBAction func resetButtonTapped(_ sender: UIButton) {
//        timer.invalidate()
//        seconds = 60
//        timerLabel.text = "\(seconds)"
//    }
//    func updateTimer(){
//        seconds -= 1
//        timerLabel.text = timeString(time:TimeInterval(seconds))
//    }
//    
//    func timeString(time:TimeInterval) -> String {
//        let hours = Int(time) / 3600
//        let minutes = Int(time) / 60 % 60
//        let seconds = Int(time) % 60
//        
//        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
//    }
//    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer_display.text = "Start the Timer"
        pauseTimer.isEnabled = false
    }


}

