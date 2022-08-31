//
//  AddAlertViewController.swift
//  DrinkWater
//
//  Created by 곽재선 on 2022/08/29.
//

import UIKit

class AddAlertViewController: UIViewController {
    var pickedDate: ((_ date: Date) -> Void)?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tapDismissButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func tapSaveButton(_ sender: UIBarButtonItem) {
        self.pickedDate?(self.datePicker.date)
        self.dismiss(animated: true)
    }
}
