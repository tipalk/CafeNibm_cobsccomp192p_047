//
//  Session.swift
//  CafeNibm
//
//  Created by Tiny Pahattuge on 2021-04-10.
//

import Foundation

class Session {
    func getloggedstate() -> Bool{
        UserDefaults.standard.bool(forKey: "Logged_in")
        return false
    }
    
    func saveuserlogin(user:User)
    {
        UserDefaults.standard.setValue(true, forKey: "Logged_in")
    }
    
    func clearuserlogin() {
        UserDefaults.standard.setValue(false, forKey: "Logged_in")
        
    }
}
