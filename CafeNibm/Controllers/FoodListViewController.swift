//
//  FoodListViewController.swift
//  CafeNibm
//
//  Created by Tiny Pahattuge on 2021-04-10.
//

import UIKit

class FoodListViewController: UIViewController{
  
    @IBOutlet weak var tblfood: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension FoodListViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}
