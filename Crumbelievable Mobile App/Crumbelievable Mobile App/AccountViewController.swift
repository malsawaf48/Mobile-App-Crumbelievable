//
//  AccountViewController.swift
//  Crumbelievable Mobile App
//
//  Created by Zakary Amekran on 2/14/24.
//

import UIKit
//try to mess with phone # cuz its null if not just set it yourself
var setBirthday:String = "1/1/1999"
class AccountViewController: UIViewController{
    
    
 
    
    //@IBOutlet weak var profilePic: UIImageView!
    @IBOutlet var userToItaly: UILabel!
    @IBOutlet var emailToItaly: UILabel!
    @IBOutlet var phoneToItaly: UILabel!
    @IBOutlet var birthdayToItaly: UILabel!
    
    
    
    
    @IBOutlet var pLLabel: UILabel!
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var emailAddyLabel: UILabel!
    @IBOutlet var phoneNumLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var termsButton: UIButton!
    @IBOutlet var updateInfoButton: UIButton!
    @IBOutlet var notisButton: UIButton!
    @IBOutlet var payButton: UIButton!
    @IBOutlet var oHButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fullNameLabel.text = fullName
        emailAddyLabel.text = emailAddy
        phoneNumLabel.text = numberOfPhone
        birthdayLabel.text = setBirthday
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded into Account")
        //updateText()
        //        profilePic.layer.cornerRadius = profilePic.frame.size.width/2
        //        profilePic.clipsToBounds = true
        //        profilePic.layer.borderColor = UIColor.blue.cgColor
        //        profilePic.layer.borderWidth = 4
        //
        
    }
    
    @IBAction func translateButton(_ sender: Any) {
        var attributedText = NSAttributedString(string: "Termini e Privacy", attributes: [
                          NSAttributedString.Key.font: termsButton.titleLabel?.font as Any,
                          NSAttributedString.Key.foregroundColor: termsButton.titleLabel?.textColor as Any
                      ])
                   termsButton.setAttributedTitle(attributedText, for: .normal)
        userToItaly.text = "Utente:"
        emailToItaly.text = "E-Mail:"
        phoneToItaly.text = "Telefono:"
        birthdayToItaly.text = "Compleanno:"
        pLLabel.text = "Informazione personale"
       
        attributedText = NSAttributedString(string: "Aggiorna le informazioni personali", attributes: [
                          NSAttributedString.Key.font: updateInfoButton.titleLabel?.font as Any,
                          NSAttributedString.Key.foregroundColor: updateInfoButton.titleLabel?.textColor as Any
                      ])
                   updateInfoButton.setAttributedTitle(attributedText, for: .normal)
        attributedText = NSAttributedString(string: "Preferenze di notifica", attributes: [
                          NSAttributedString.Key.font: notisButton.titleLabel?.font as Any,
                          NSAttributedString.Key.foregroundColor: notisButton.titleLabel?.textColor as Any
                      ])
                   notisButton.setAttributedTitle(attributedText, for: .normal)
        attributedText = NSAttributedString(string: "Informazioni sul p", attributes: [
                          NSAttributedString.Key.font: payButton.titleLabel?.font as Any,
                          NSAttributedString.Key.foregroundColor: payButton.titleLabel?.textColor as Any
                      ])
                   payButton.setAttributedTitle(attributedText, for: .normal)
        attributedText = NSAttributedString(string: "Visualizza la cronologia degli ordini", attributes: [
                          NSAttributedString.Key.font: oHButton.titleLabel?.font as Any,
                          NSAttributedString.Key.foregroundColor: oHButton.titleLabel?.textColor as Any
                      ])
                   oHButton.setAttributedTitle(attributedText, for: .normal)
    }
   
}
