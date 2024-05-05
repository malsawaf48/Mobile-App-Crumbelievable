//
//  MenuViewController.swift
//  Crumbelievable Mobile App
//
//  Created by Zakary Amekran on 2/14/24.
//

import UIKit

class MenuViewController: UIViewController {
    
// --MARK: Outlets
    
    
    @IBOutlet var coffeeButton: UIButton!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var cookieButton: UIButton!
    @IBOutlet var coffeeMenuView: UIView!
    @IBOutlet var cookieMenuView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cookieMenuView.isHidden = true
        backButton.isHidden = true
        coffeeMenuView.isHidden = true
        
        

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
    @IBAction func coffeeButtonTapped(_ sender: Any) {
        coffeeButton.isHidden = true
        cookieButton.isHidden = true
        backButton.isHidden = false
        coffeeMenuView.isHidden = false
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        cookieMenuView.isHidden = true
        coffeeButton.isHidden = false
        cookieButton.isHidden = false
        backButton.isHidden = true
        coffeeMenuView.isHidden = true
        
    }
    
    @IBAction func cookieButtonTapped(_ sender: Any) {
        cookieMenuView.isHidden = false
        cookieButton.isHidden = true
        coffeeButton.isHidden = true
        backButton.isHidden = false
    }
    


}

