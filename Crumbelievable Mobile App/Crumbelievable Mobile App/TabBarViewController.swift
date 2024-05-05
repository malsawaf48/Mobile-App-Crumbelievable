//
//  TabBarViewController.swift
//  Crumbelievable Mobile App
//
//  Created by Zakary Amekran on 4/22/24.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        updateTabBarItems()
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    func updateTabBarItems() {
        if let viewControllers = viewControllers {
       // Indexes of the view controllers whose tab bar items need to be updated
       let disabledViewControllerIndexes = [3, 4]

       // Loop through the view controllers
       for (index, viewController) in viewControllers.enumerated() {
           print("test")
           // Check if the current view controller needs its tab bar item updated
           if disabledViewControllerIndexes.contains(index) {
               // Update the isEnabled property based on the sign-in status
               viewController.tabBarItem.isEnabled = signedIn
           }
       }
   }
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
