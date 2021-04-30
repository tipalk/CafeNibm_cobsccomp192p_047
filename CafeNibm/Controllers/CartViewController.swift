//
//  CartViewController.swift
//  CafeNibm
//
//  Created by Tiny Pahattuge on 2021-04-30.
//

import UIKit
import Firebase
import Loaf

class CartViewController: UIViewController {

    @IBOutlet weak var tblcartitems: UITableView!
    
    var cartitems : [FoodItem] = []
    let sessionmgr = Session()
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cartitems = CardHandler.getCartItem()
        ref = Database.database().reference()
        tblcartitems.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "foodcelluseidentifier")
        
        
    }
    
    @IBAction func tbnback(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func onconfirmpressed(_ sender: Any) {
        saveorder()
    }
    
}

extension CartViewController{
    func saveorder()  {
        var orderData : [String :Any] = [:]
        var foodIteminfo :[String:Any] = [:]
        
        for index in 0..<cartitems.count{
            foodIteminfo.removeAll()
            foodIteminfo["Foodname"] = cartitems[index].Foodname
            foodIteminfo["Fooddescription"] = cartitems[index].Fooddescription
            foodIteminfo["Foodprice"] = cartitems[index].Foodprice
            orderData["\(index)"] = foodIteminfo
        }
        
        var order : [String:Any] = [:]
        order["status"] = "Pending"
        order["orderItems"] = orderData
        
        self.ref.child("orders")
            .child(sessionmgr.getUserData().Useremail
                                        .replacingOccurrences(of: "@", with: "_")
                                        .replacingOccurrences(of: ".", with: "_"))
            .childByAutoId()
            
            .setValue(cartitems){
            (error,ref) in
            if let err = error{
                print(err.localizedDescription)
                Loaf("Order data not saved ",state:.error,sender:self).show()
                return
            }
            
                                            
            Loaf("Order data  saved ",state:.success,sender:self).show{
                type in
                CardHandler.clearCart()
                self.dismiss(animated: true, completion: nil)
            }
            
             
        }
    }
}

extension CartViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartitems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblcartitems.dequeueReusableCell(withIdentifier: "foodcelluseidentifier", for: indexPath) as!FoodTableViewCell
        cell.setUpView(fooditem: cartitems[indexPath.row])
        return cell
    }
}
