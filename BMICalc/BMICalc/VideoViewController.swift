//
//  VideoViewController.swift
//  BMICalc
//
//  Created by 곽재선 on 2022/05/08.
//

import UIKit
import AVKit

class VideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func playVideo(_ sender: UIButton) {
        let file: String? = Bundle.main.path(forResource: "BMI", ofType: "mp4")
        let url = NSURL(fileURLWithPath: file!)
        let playerController = AVPlayerViewController()
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        self.present(playerController, animated: true)
        player.play()
    }
}
