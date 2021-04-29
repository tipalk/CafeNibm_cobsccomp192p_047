//
//  ProfileViewController.swift
//  CafeNibm
//
//  Created by Tiny Pahattuge on 2021-04-30.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Signout(_ sender: UIButton) {
        let sessionManager = Session()
        sessionManager.clearuserlogin()
    }
    

}
