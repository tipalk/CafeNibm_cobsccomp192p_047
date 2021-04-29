//
//  FoodListViewController.swift
//  CafeNibm
//
//  Created by Tiny Pahattuge on 2021-04-10.
//

import UIKit
import Firebase

class FoodListViewController: UIViewController{
  
    var ref: DatabaseReference!
    @IBOutlet weak var tblfood: UITableView!
    
    var fooditems : [FoodItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tblfood.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "foodcelluseidentifier")
        
        ref = Database.database().reference()
        getItemData()
    }
}

extension FoodListViewController{
    func getItemData() {
        ref.child("foodItems").observe(.value) { (snapshot) in
            if let data = snapshot.value{
                if let foodItems = data as?[String:Any]{
                    for item in foodItems{
                        if let foodinfo = item.value as? [String : Any]{
                            let singlefooditem = FoodItem(_id:"",
                                                          Foodname:foodinfo["name"] as! String,
                                                          Fooddescription:foodinfo["description"] as! String,
                                                          Foodprice:foodinfo["price"] as! Double,
                                                          Discount: foodinfo["discount"] as! Int,
                                                          catergory:foodinfo["catergory"] as! String,
                                                          image:foodinfo["image"] as! String )
                            self.fooditems.append(singlefooditem)
                        }
                    }
                    self.tblfood.reloadData()
                }
            }
        }
    }
}

extension FoodListViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fooditems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblfood.dequeueReusableCell(withIdentifier: "foodcelluseidentifier", for: indexPath) as!FoodTableViewCell
        cell.setUpView(fooditem: fooditems[indexPath.row])
        return cell
        
    }
    
}
 
