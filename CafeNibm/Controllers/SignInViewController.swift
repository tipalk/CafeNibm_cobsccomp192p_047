//
//  SignInViewController.swift
//  CafeNibm
//
//  Created by Tiny Pahattuge on 2021-04-10.
//

import UIKit
import Firebase
import Loaf

class SignInViewController: UIViewController {

    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var onsignin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onsigninclick(_ sender: Any) {
        if !InputValidator.isValidEmail(email: txtemail.text ?? ""){
            Loaf("Invalid Email address ",state:.error,sender:self).show()
            return
        }
        
        if !InputValidator.isValidPassword(pass: txtpassword.text ?? "" , minLength: 6, maxLength: 50){
            Loaf("Invalid Email address ",state:.error,sender:self).show()
            return
        }
        
        AuthenticateUser(email: txtemail.text!, password: txtpassword.text!)
        
    }
    
    
    func AuthenticateUser(email:String,password:String){
        Auth.auth().signIn(withEmail: email, password: password) {  authResult, error in
          
            if let err = error{
                print(err.localizedDescription)
                Loaf("User name or password is invalid",state:.error,sender:self).show()
                return
            }
            
            self.performSegue(withIdentifier: "SignInTohome", sender: nil)
        }
    }
}
