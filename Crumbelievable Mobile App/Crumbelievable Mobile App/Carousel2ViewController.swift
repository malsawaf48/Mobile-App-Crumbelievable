//
//  ViewController.swift
//  help
//
//  Created by Zakary Amekran on 4/3/24.
//

import UIKit

class Carousel2ViewController: UIViewController {
//arrow carousel doesnt work perf but works sorta

    var current = 0
    @IBOutlet var view2: UIView!
    @IBOutlet var view1: UIView!
    @IBOutlet var view3: UIView!
    
    @IBOutlet var leftButton: UIButton!
    

    
    
    override func viewDidLoad() {
        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
        leftButton.isEnabled = false
        let arrayV = [view1, view2, view3]
        super.viewDidLoad()
        arrayV[current]?.isHidden = false
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func leftButtonPressed(_ sender: Any) {
        let arrayV = [view1, view2, view3]
        current = current - 1
        if current >= 0{
            arrayV[current+1]?.isHidden = true
            arrayV[current]?.isHidden = false
        }else{
            leftButton.isEnabled = false
        }
    }
    
    @IBAction func rightButtonPressed(_ sender: Any) {
        leftButton.isEnabled = true
        let arrayV = [view1, view2, view3]
        current = current + 1
        if current == 0{
            
        }
        else if current<arrayV.count{
            arrayV[current-1]?.isHidden = true
            arrayV[current]?.isHidden = false
        } else{
            arrayV[current-1]?.isHidden = true
            current = 0
            arrayV[current]?.isHidden = false
        }
        
        
    }

}

