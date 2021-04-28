//
//  SignUpViewController.swift
//  CafeNibm
//
//  Created by Tiny Pahattuge on 2021-04-10.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txttelnumber: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickSignUp(_ sender: Any) {
        if ValidaeInput() {
            createUser(email: txtemail.text!, password: txtpassword.text!)
        }
        else
        {
            print("error occured")
        }
    }
    
    func ValidaeInput() -> Bool
    {
        guard let name = txtname.text else {
            print("Name is null")
            return false
        }
        
        guard let email = txtemail.text else {
            print("email is null")
            return false
        }
        
        guard let password = txtpassword.text else {
            print("password is null")
            return false
        }
        
        guard let telnum = txttelnumber.text else {
            print("teliphone number is null")
            return false
        }
        
        if name.count<1{
            print("Enter a valid name")
            return false
        }
        
        if email.count<5{
            print("Enter a valid email")
            return false
        }
        
        if password.count<5{
            print("Enter a valid password")
            return false
        }
        
        if telnum.count<10 || telnum.count>10 {
            print("Enter a valid Telephone number")
            return false
        }
        return true;
    }
    
    func createUser (email:String,password:String){
        Auth.auth().createUser(withEmail: email, password: password ) { authResult, error in
            
            if let err = error{
                print(err.localizedDescription)
                return
            }
            
            if let result = authResult{
                print("User email :\(result.user.email ?? "Not Found")")
                
            }
        }
   
    }
    
    
    @IBAction func GoToSignin(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
