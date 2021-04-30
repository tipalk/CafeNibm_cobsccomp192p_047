//
//  ProfileViewController.swift
//  CafeNibm
//
//  Created by Tiny Pahattuge on 2021-04-30.
//

import UIKit

class ProfileViewController: UIViewController {

    let sessionManager = Session()
    
    @IBOutlet weak var txtname: UILabel!
    @IBOutlet weak var txtmail: UILabel!
    @IBOutlet weak var txttelnumber: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = sessionManager.getUserData()
        txtname.text=user.Username
        txtmail.text=user.Useremail
        txttelnumber.text = user.Phonenumber
            }
    

    @IBAction func Signout(_ sender: UIButton) {
        
        sessionManager.clearuserlogin()
    }
    

}
