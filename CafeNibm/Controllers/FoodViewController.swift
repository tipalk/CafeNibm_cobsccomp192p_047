//
//  FoodViewController.swift
//  CafeNibm
//
//  Created by Tiny Pahattuge on 2021-04-30.
//

import UIKit


class FoodViewController: UIViewController {

    @IBOutlet weak var imgfoodimg: UIImageView!
    @IBOutlet weak var lblfoodname: UILabel!
    @IBOutlet weak var lblfooddescription: UILabel!
    @IBOutlet weak var lblfoodprice: UILabel!
    
    var foodItem : FoodItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = self.foodItem {
            imgfoodimg.kf.setImage(with: URL(string: item.image))
            lblfoodname.text = item.Foodname
            lblfooddescription.text = item.Fooddescription
            lblfoodprice.text = "LKR\(item.Foodprice)"
            
        }
    }
    
    
    @IBAction func btnback(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnaddtocart(_ sender: Any) {
        if let item = self.foodItem {
        CardHandler.foodItems.append(item)
    }
        print(CardHandler.foodItems)
    }
}
