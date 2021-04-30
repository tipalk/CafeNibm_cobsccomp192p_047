//
//  OrderTableViewCell.swift
//  CafeNibm
//
//  Created by Tiny Pahattuge on 2021-04-30.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var lblorderid: UILabel!
    @IBOutlet weak var lblstatus: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(order :Order)  {
        lblorderid.text = order.orderId
        lblstatus.text = order.orderStatus
        lblprice.text = "LKR\(order.orderTotal)"
    }
}
