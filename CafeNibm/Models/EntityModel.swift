//
//  EntityModel.swift
//  CafeNibm
//
//  Created by Tiny Pahattuge on 2021-04-10.
//

import Foundation

struct User {
    var Username :String
    var Useremail : String
    var Userpassword : String
    var Phonenumber : String
}

struct FoodItem {
    var _id :String
    var Foodname :String
    var Fooddescription : String
    var Foodprice : Double
    var Discount : Int
    var catergory : String
}
