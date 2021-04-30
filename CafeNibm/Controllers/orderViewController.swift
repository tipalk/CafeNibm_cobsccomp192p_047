//
//  orderViewController.swift
//  CafeNibm
//
//  Created by Tiny Pahattuge on 2021-04-30.
//

import UIKit
import Firebase
import Loaf

class orderViewController: UIViewController {

    var ref: DatabaseReference!
    let sessionmgr = Session()
    
    @IBOutlet weak var tblorders: UITableView!
    var orders : [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        tblorders.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "Ordercellreuseidentifier")
       
    }
    override func viewDidAppear(_ animated: Bool) {
        GetAllOrders()
    }
    
}
extension orderViewController{
    func GetAllOrders(){
        self.orders.removeAll()
        self.ref.child("orders")
            .child(sessionmgr.getUserData().Useremail
                                        .replacingOccurrences(of: "@", with: "_")
                                        .replacingOccurrences(of: ".", with: "_"))
            
            .observe(.value, with: {
                snapshot in
                if let data = snapshot.value{
                    if let orders = data as? [String:Any]{
                    for singleorder in orders{
                        var placedorder = Order()
                        placedorder.orderId = singleorder.key
                        if let orderInfo = singleorder.value as? [String:Any] {
                            placedorder.orderStatus = orderInfo["status"] as! String
                            if let orderitems = orderInfo["orderItems"] as? [Any]{
                                for item in orderitems {
                                   if let iteminfo = item as? [String:Any]
                                   {
                                    placedorder.orderTotal += iteminfo["Foodprice"] as! Double
                                    
                                   }
                                }
                            }
                        }
                        self.orders.append(placedorder)
                    }
                        self.tblorders.reloadData()
                    }
                }
            })
    }
}

extension orderViewController :UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblorders.dequeueReusableCell(withIdentifier: "Ordercellreuseidentifier", for: indexPath) as! OrderTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    
}
