//
//  CountDownViewController.swift
//  app
//
//  Created by sina on 7.11.2023.
//  Copyright © 2023 KZ. All rights reserved.
//

import UIKit

class CountDownViewController: UIViewController {
    @IBOutlet weak var UIButtonReset: UIButton!
    @IBOutlet weak var UIButtonStart: UIButton!

    @IBOutlet weak var countUILabel: UILabel!
    @IBOutlet weak var UIButtonSecondPlayer: UIButton!
    @IBOutlet weak var UIButtonFirstPlayer: UIButton!

    @IBOutlet weak var secondPlayerUIView: UIView!
    @IBOutlet weak var firstPlayerUIView: UIView!

    var isFirstUserTouched = false
    var isSecondUserTouched = false
    var gameStartTimestamp: Int?
    var count: Int = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        UIButtonFirstPlayer.isEnabled = false
        UIButtonSecondPlayer.isEnabled = false

    }

    @IBAction func actionStart(_ sender: UIButton) {
        UIButtonStart.isEnabled = false

        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in

            self.count -= 1
            self.countUILabel.text = String(self.count)
            if self.count==0 {
                timer.invalidate()
                self.UIButtonFirstPlayer.isEnabled = true
                self.UIButtonSecondPlayer.isEnabled = true
                let date = Date()
                self.gameStartTimestamp = Int(date.timeIntervalSince1970 * 1000)
            }

        }
    }

    @IBAction func actionReset(_ sender: UIButton) {
        count = 5
        countUILabel.text = String(count)
        UIButtonStart.isEnabled = true
        self.UIButtonSecondPlayer.isEnabled = false
        self.UIButtonFirstPlayer.isEnabled = false
        gameStartTimestamp = nil
    }

    @IBAction func actionFirstUserTouched(_ sender: UIButton) {

        self.UIButtonSecondPlayer.isEnabled = false
        self.UIButtonFirstPlayer.isEnabled = false

        let date = Date()
        let touchTime = Int(date.timeIntervalSince1970 * 1000) - gameStartTimestamp!

        countUILabel.text = "First Player Win in \(touchTime)"

    }

    @IBAction func actionSecondUserTouched(_ sender: UIButton) {

        self.UIButtonFirstPlayer.isEnabled = false
        self.UIButtonSecondPlayer.isEnabled = false

        let date = Date()
        let touchTime = Int(date.timeIntervalSince1970 * 1000) - gameStartTimestamp!

        countUILabel.text = "Second Player Win in \(touchTime)"
    }
}
