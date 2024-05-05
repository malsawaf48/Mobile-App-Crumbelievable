//
//  ViewController.swift
//  Crumbelievable Mobile App
//
//  Created by Zakary Amekran on 2/9/24.
//
//code i took out of inferredMetricsTieBreakers: <segue reference="ZGe-hy-SNB"/>

//TODO: need to make the button label text back to how it was 

import UIKit
import MapKit
import SwiftUI
var signedIn:Bool = false

class ViewController: UIViewController {
    @Environment(\.openURL) private var openURL
   
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var lblSignIn: UILabel!
    @IBOutlet var lblSignOut: UILabel!
    
    @IBOutlet var menuSegueOne: UILabel!
    @IBOutlet var menuSegueTwo: UILabel!
    @IBOutlet var menuSegueThree: UILabel!
    @IBOutlet var menuSegueFour: UILabel!
    @IBOutlet var menuSegueFive: UILabel!
    @IBOutlet var menuSegueSix: UILabel!
    
    @IBOutlet var alreadyAMemberLabel: UILabel!
    @IBOutlet var joinNowButton: UIButton!
    @IBOutlet var joinRewardsText: UITextField!
    @IBOutlet var newJoinButton: UIButton!
    @IBOutlet var viewRewardsButton: UIButton!
    
    @IBOutlet var joinRewardsTextField: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var scrollView1: UIScrollView!
    func updateSignInButtonTitle() {
        
        if signedIn == true{
            lblSignIn.isHidden = true
            lblSignOut.isHidden = false
//            let attributedText = NSAttributedString(string: "View Rewards", attributes: [
//                   NSAttributedString.Key.font: newJoinButton.titleLabel?.font as Any,
//                   NSAttributedString.Key.foregroundColor: newJoinButton.titleLabel?.textColor as Any
//               ])
//            newJoinButton.setAttributedTitle(attributedText, for: .normal)
               //this works, use later maybe
               
            newJoinButton.isHidden = true
            viewRewardsButton.isHidden = false
            
            joinRewardsTextField.text = "Thank you for being a Crumbelievable Member! Have a great day!"
            alreadyAMemberLabel.text = "All Done?"
            
        }
    }
        
        
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "unwindToHomePage" {
//            // This method will be called when unwinding from the sign-in view controller
//            // You can perform any necessary actions here, such as updating UI elements
//        }
//    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let attributedText = NSAttributedString(string: "Join Now", attributes: [
//               NSAttributedString.Key.font: newJoinButton.titleLabel?.font as Any,
//               NSAttributedString.Key.foregroundColor: newJoinButton.titleLabel?.textColor as Any
//           ])
//        newJoinButton.setAttributedTitle(attributedText, for: .normal)
//           
        
        //MKCoordinateRegion(latitude: 42.324896, longitude: -83.236756)
        let crumbelievableLocation = CLLocationCoordinate2D (latitude: 42.324896, longitude: -83.236756)
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        let myregion = MKCoordinateRegion(center: crumbelievableLocation, span: span)
        let ayo = MKMapView()
        ayo.region = myregion
        let crumbs = MKPointAnnotation(__coordinate: CLLocationCoordinate2D(latitude: 42.324896, longitude:-83.236756))
        crumbs.title = "Crumbelievable"
        ayo.addAnnotation(crumbs)
        scrollView1.addSubview(ayo)
        ayo.frame = CGRect(x: 0, y: 1850, width: 400, height: 300)
        
        
        
        fetchData(username: "admin", password: "cpWxXb94"){ result in
            switch result {
            case .success(let userData):
                print("in main")
                print("Username: \(userData.user.username)")
                // Access other properties of response.user as needed
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    
        //print(signedIn)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.lblSignOutPressed(_:)))
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.lblSignInPressed))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.tooMenuSegue))
        
        
        
        
        //just a heads up to anyone reading this none of these labels work to segue into the menu page and I got too lazy to figure out a work-around, only the see full menu button ended up working
        menuSegueOne.addGestureRecognizer(tap)
        menuSegueOne.isUserInteractionEnabled = true
        self.view.bringSubviewToFront(menuSegueOne)
        
        
        menuSegueTwo.isUserInteractionEnabled = true
        menuSegueTwo.addGestureRecognizer(tap3)
        menuSegueThree.isUserInteractionEnabled = true
        menuSegueThree.addGestureRecognizer(tap3)
        menuSegueFour.isUserInteractionEnabled = true
        menuSegueFour.addGestureRecognizer(tap3)
        menuSegueFive.isUserInteractionEnabled = true
        menuSegueFive.addGestureRecognizer(tap3)
        menuSegueSix.isUserInteractionEnabled = true
        menuSegueSix.addGestureRecognizer(tap3)
        
        lblSignIn.addGestureRecognizer(tap)
        lblSignIn.isUserInteractionEnabled = true
        scrollView.addSubview(mainView)
        scrollView.addSubview(MKMapView(frame: CGRect(x: 0, y: 1597, width: 500, height: 400)))
        lblSignOut.addGestureRecognizer(tap2)
        lblSignOut.isUserInteractionEnabled = true
    }

    @objc func lblSignInPressed(_ gestureRecognizer:UITapGestureRecognizer){
        performSegue(withIdentifier: "attemptSignIn", sender: gestureRecognizer)
        updateSignInButtonTitle()
        
    }
    
    @objc func tooMenuSegue(_
        gestureRecognizer: UITapGestureRecognizer){
        performSegue(withIdentifier: "toMenu", sender: gestureRecognizer)
    }

    @IBAction func igButtonPressed(_ sender: Any) {
        if let url = URL(string: "https://www.instagram.com"){
            openURL(url)
        }
    }
    @IBAction func twitButtonPressed(_ sender: Any) {
        if let url = URL(string: "https://twitter.com"){
            openURL(url)
        }
    }
    
    @IBAction func fbButtonPressed(_ sender: Any) {
        if let url = URL(string: "https://www.facebook.com"){
            openURL(url)
        }
    }
    
   
    @objc func lblSignOutPressed(_
        gestureRecognizer: UITapGestureRecognizer){
        signedIn = false
        //make account and rewards page not enabled
        lblSignIn.isHidden = false
        lblSignOut.isHidden = true
        let attributedText = NSAttributedString(string: "Join Now", attributes: [
               NSAttributedString.Key.font: newJoinButton.titleLabel?.font as Any,
               NSAttributedString.Key.foregroundColor: newJoinButton.titleLabel?.textColor as Any
           ])
        newJoinButton.setAttributedTitle(attributedText, for: .normal)
        alreadyAMemberLabel.text = "Already a member?"
        joinRewardsText.text = "Join                               Rewards"
        newJoinButton.isHidden = false
        viewRewardsButton.isHidden = true
        
        
        joinRewardsTextField.text = "Join now to earn points, enjoy exclusive offers, and view your order history."
        
        if let tabBarVC = self.tabBarController as? TabBarViewController {
                    tabBarVC.updateTabBarItems()
                }
    }
    override func viewDidAppear(_ animated: Bool) {
       scrollView1.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+1300)
    }
    
    
}

