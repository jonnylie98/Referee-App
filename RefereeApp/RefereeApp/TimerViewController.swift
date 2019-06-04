//
//  ViewController.swift
//  RefereeApp
//
//  Created by Franco  Buena on 29/5/19.
//  Copyright © 2019 Franco Buena. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    var time: Int = 0
    var timer = Timer()
    
    @IBOutlet weak var gameTimer: UILabel!
    @IBAction func start(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startTime), userInfo: nil, repeats: true)
    }
    @IBAction func pause(_ sender: UIButton) {
        timer.invalidate()
    }
    @IBAction func reset(_ sender: Any) {
        time = 0
        gameTimer.text = String(formatTime(time))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameTimer.text = formatTime(time)
    }
    
    @objc func startTime() {
        time += 1
        gameTimer.text = String(formatTime(time))
    }
    
    func formatTime(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%01d:%02d", minutes, seconds)
    }


}
