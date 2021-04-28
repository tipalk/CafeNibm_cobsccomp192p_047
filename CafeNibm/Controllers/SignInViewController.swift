//
//  SignInViewController.swift
//  CafeNibm
//
//  Created by Tiny Pahattuge on 2021-04-10.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var onsignin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onsigninclick(_ sender: Any) {
        if ValidaeInput() {
            AuthenticateUser(email: txtemail.text!, password: txtpassword.text!)
        }
        else
        {
            print("Input error found")
        }
    }
    
    func ValidaeInput() -> Bool
    {
        guard let email = txtemail.text else {
            print("Email is null")
            return false
        }
        guard let pw = txtpassword.text else {
            print("password is null")
            return false
        }
        if email.count<5{
            print("Enter a valid email")
            return false
        }
        if pw.count<5{
            print("Enter a valid password")
            return false
        }
        
        return true;
    }
    
    func AuthenticateUser(email:String,password:String){
        Auth.auth().signIn(withEmail: email, password: password) {  authResult, error in
          
            if let err = error{
                print(err.localizedDescription)
                return
            }
            
            if let result = authResult{
                print("User email :\(result.user.email ?? "Not Found")")
                
            }
         
        }
    }
}
