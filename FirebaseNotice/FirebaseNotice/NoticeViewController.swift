//
//  NoticeViewController.swift
//  FirebaseNotice
//
//  Created by 곽재선 on 2022/08/02.
//

import UIKit

class NoticeViewController: UIViewController {
    var noticeContents: (title: String, detail: String, date: String)?
    
    @IBOutlet weak var noticeView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.noticeView.layer.cornerRadius = 6
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        guard let noticeContents = noticeContents else { return }
        self.titleLabel.text = noticeContents.title
        self.detailLabel.text = noticeContents.detail
        self.dateLabel.text = noticeContents.date
        
    }

    @IBAction func tapDoneButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
