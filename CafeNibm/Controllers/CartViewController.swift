//
//  CartViewController.swift
//  CafeNibm
//
//  Created by Tiny Pahattuge on 2021-04-30.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tblcartitems: UITableView!
    
    var cartitems : [FoodItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cartitems = CardHandler.getCartItem()
        
        tblcartitems.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "foodcelluseidentifier")
        
        
    }
    
    @IBAction func tbnback(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func onconfirmpressed(_ sender: Any) {
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
