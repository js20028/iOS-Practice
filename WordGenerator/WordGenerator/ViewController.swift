//
//  ViewController.swift
//  WordGenerator
//
//  Created by 곽재선 on 2022/03/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var wordEn: UILabel!
    @IBOutlet weak var wordKor: UILabel!
    
    let words = [
        Word(wordEn: "apple", wordKor: "사과"),
        Word(wordEn: "banana", wordKor: "바나나"),
        Word(wordEn: "yellow", wordKor: "노란색"),
        Word(wordEn: "tree", wordKor: "나무"),
        Word(wordEn: "cat", wordKor: "고양이")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func wordGeneratorButton(_ sender: UIButton) {
        let random = Int.random(in: 0...4)
        self.wordEn.text = words[random].wordEn
        self.wordKor.text = words[random].wordKor
    }
    
}

