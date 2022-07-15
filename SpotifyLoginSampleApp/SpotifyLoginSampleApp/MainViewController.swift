//
//  MainViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 곽재선 on 2022/07/14.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var resetPaswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        
        let email = Auth.auth().currentUser?.email ?? "고객"
        self.welcomeLabel.text = """
        환영합니다.
        \(email)님
        """
        
        // 이메일로 로그인했는지 안했는지 알수있음
        let isEmailSignIn = Auth.auth().currentUser?.providerData[0].providerID == "password"
        self.resetPaswordButton.isHidden = !isEmailSignIn
        
    }
    
    @IBAction func tapLogoutButton(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            self.navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error : signout \(signOutError.localizedDescription)")
        }
        
    }
    @IBAction func tapResetPaswordButton(_ sender: UIButton) {
        // 현재 사용자가 로그인한 이메일로 비밀번호를 변경할수 있는 메일을 보내게 됨
        let email = Auth.auth().currentUser?.email ?? ""
        Auth.auth().sendPasswordReset(withEmail: email, completion: nil)
    }
}
