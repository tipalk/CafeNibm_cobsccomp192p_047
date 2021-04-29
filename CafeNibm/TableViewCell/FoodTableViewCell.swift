//
//  FoodTableViewCell.swift
//  CafeNibm
//
//  Created by Tiny Pahattuge on 2021-04-28.
//

import UIKit
import Kingfisher

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var lbldiscount: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lblfooddescription: UILabel!
    @IBOutlet weak var lblfoodname: UILabel!
    @IBOutlet weak var imgfood: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpView(fooditem :FoodItem){
        lblfoodname.text = fooditem.Foodname
        lblfooddescription.text=fooditem.Fooddescription
        lblprice.text="LKR\(fooditem.Foodprice)"
        imgfood.kf.setImage(with: URL(string: fooditem.image))
        
        if fooditem.Discount>0{
            lbldiscount.text = "\(fooditem.Discount)%"
        }else{
            lbldiscount.text = ""
        }
    }
    
}
