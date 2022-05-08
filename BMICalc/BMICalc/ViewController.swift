//
//  ViewController.swift
//  BMICalc
//
//  Created by 곽재선 on 2022/05/05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblResult.clipsToBounds = true
        self.lblResult.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    @IBAction func calcBmi(_ sender: UIButton) {
        if self.txtHeight.text?.isEmpty == true || self.txtWeight.text?.isEmpty == true {
            self.lblResult.text = "키와 몸무게를 모두 입력하세요!"
            return
        } else {
            guard let height = self.txtHeight.text else { return }
            guard let weight = self.txtWeight.text else { return }
            
            if let doubleHeight = Double(height), let doubleWeight = Double(weight) {
                print(doubleHeight, doubleWeight)
                let bmi = doubleWeight / (doubleHeight * doubleHeight * 0.0001)
                let shortBmi = String(format: "%.1f", bmi)
                var body = ""
                if bmi >= 40 {
                    body = "3단계 비만"
                    self.lblResult.backgroundColor = .red
                } else if bmi >= 30 && bmi < 40 {
                    body = "2단계 비만"
                    self.lblResult.backgroundColor = .orange
                } else if bmi >= 25 && bmi < 30 {
                    body = "1단계 비만"
                    self.lblResult.backgroundColor = .yellow
                } else if bmi >= 18.5 && bmi < 25 {
                    body = "정상"
                    self.lblResult.backgroundColor = UIColor(red: 0.8, green: 1.0, blue: 1.0, alpha: 1.0)
                } else {
                    body = "저체중"
                    self.lblResult.backgroundColor = .green
                }
                self.lblResult.text = "BMI: \(shortBmi), 판정: \(body)"
                
            }
        }
    }
    
}

