//
//  OrderTabBarViewController.swift
//  
//
//  Created by Zakary Amekran on 4/29/24.
//

import UIKit

class OrderTabBarViewController: UINavigationController {
    override func viewWillAppear(_ animated: Bool) {
        tabBarItem.badgeValue = "\(OrderItems.count)"

    }
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
