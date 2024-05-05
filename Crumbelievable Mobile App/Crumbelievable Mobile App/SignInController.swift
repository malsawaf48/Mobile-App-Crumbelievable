//
//  SignInControllerViewController.swift
//  Crumbelievable Mobile App
//
//  Created by Hassan Chahrour on 2/20/24.
// = "cpWxXb94"    = "admin"

import UIKit
//import GoogleSignIn
//import GoogleSignInSwift
import SwiftUI

var nameUser:String = "admin"
var wordPass:String = "cpWxXb94"
var rewardsPoints:Int = 0
var fullName:String = ""
var emailAddy:String = ""
var numberOfPhone:String = ""

class SignInController: UIViewController {
    @Environment(\.openURL) private var openURL
    
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    var localSignIn: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.addSubview(GIDSignInButton())
        self.view.subviews[2].frame = CGRect(x: 150, y: 60, width: 30, height: 50)
//        self.view.subviews[2].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.signIn)))
        
    }
    
    @IBAction func usernameEntered(_ sender: Any) {
        
    }
    
    @IBAction func passwordEntered(_ sender: Any) {
        
    }
    
//    @IBAction func signIn(sender: Any) {
//      GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
//        guard error == nil else { return }
//
//        // If sign in succeeded, display the app's main content View.
//      }
//    }
// 
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
//        nameUser = usernameField.text!
//        wordPass = passwordField.text!
        //UNCOMMENT WHEN DONE V IMPORTANT 
        fetchData(username: nameUser, password: wordPass){result in
            
                switch result {
                case .success(let userData):
                    signedIn = true
                    print("Username: \(userData.user.username)")
                    print("whaaat")
                    rewardsPoints = userData.user.rewardPoints
                    fullName = userData.user.firstName + " " + userData.user.lastName
                    emailAddy = userData.user.email
                    numberOfPhone = userData.user.phoneNumber ?? "313-123-4567"
                    //WORKS RAHHHHHHHHHHHHHHUHH!ħú
                    // Access other properties of response.user as needed
                case .failure(let error):
                    print("Incorrect Username Or Password")
                    print(nameUser)
                    print(wordPass)
                    print(error.localizedDescription)
                    
                }
           
            
        }
        if let signedIn = localSignIn{
            if (localSignIn == false){
                print(nameUser)
                print(wordPass)
                print("Incorrect Username Or Password")
            }
            else{
                print("RAHHHH")
            }
        }
        
        if let tabBarVC = self.tabBarController as? TabBarViewController {
                    tabBarVC.updateTabBarItems()
                }
      //  performSegue(withIdentifier: "unwindToHomePage", sender: self)
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        if let url = URL(string: "https://crumbelievable.cis294.hfcc.edu/register"){
            openURL(url)
        }
    }
    
    
  /*
    @IBAction func register(_ sender: Any) {
        guard let username = usernameTextField.text as String?, let password = passwordTextField.text as String? else {return}
               if userDefaults.object(forKey: username) != nil {
                   print("Username already exists. Please choose a different one.")
               } else {
                   userDefaults.set(password, forKey: username)
                   print("Registration successful!")
               }
    }
    @IBAction func loginPressed(_ sender: Any) {
       guard let username = usernameTextField.text as String?, let password = passwordTextField.text as String? else {return}
                if let savedPassword = userDefaults.string(forKey: username) {
                    if password == savedPassword {
                        print("Login successful!")
                        performSegue(withIdentifier: "toPlayArea", sender: login)
                    } else {
                        print("Incorrect password. Please try again.")
                    }
                } else {
                    print("Username not found. Please register.")
                }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
    }
    func update(_ deg: CGFloat){
        aceimage.transform.rotated(by: deg)
    }
*/
}
