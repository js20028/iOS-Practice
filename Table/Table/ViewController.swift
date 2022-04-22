//
//  ViewController.swift
//  Table
//
//  Created by 곽재선 on 2022/04/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "myCell")
//
//        var content = cell.defaultContentConfiguration()
//        content.image = UIImage(systemName: "star")
//        content.text = "\(indexPath.row)"
//        content.secondaryText = indexPath.description
//        cell.contentConfiguration = content

        let cell = table.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        // dequeueReusableCell은 UITableViewCell을 리턴하기때문에 자식클래스인 MyTableViewCell의 프로퍼티(myLabel)에 접근할수 없으므로 자식클래스타입으로 다운캐스팅 해야함
        cell.myLabel.text = indexPath.description
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

}

