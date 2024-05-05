//
//  ChangeInfoViewController.swift
//  Crumbelievable Mobile App
//
//  Created by Zakary Amekran on 4/27/24.
//

import UIKit

class ChangeInfoViewController: UIViewController {

  
    @IBOutlet var entireName: UITextField!
    @IBOutlet var entireEmail: UITextField!
    @IBOutlet var entireNumber: UITextField!
    @IBOutlet var entireBirthday: UITextField!
    
    
    private var textFields = [UITextField]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFields.append(entireName)
        textFields.append(entireEmail)
        textFields.append(entireNumber)
        textFields.append(entireBirthday)
        
    }
    
    @IBAction func onClick(_ sender: Any) {
        var incrementer:Int = 0
        for item in textFields{
            if ((item.text?.isEmpty) == false){
                switch(incrementer){
                case 0:
                    fullName = entireName.text!
                    break
                case 1:
                    emailAddy = entireEmail.text!
                    break
                case 2:
                    numberOfPhone = entireNumber.text!
                    break
                case 3:
                    setBirthday = entireBirthday.text!
                    break
                    
                default:
                    print("broken")
                }
            }
            incrementer = incrementer + 1
        }
    }
    
}
