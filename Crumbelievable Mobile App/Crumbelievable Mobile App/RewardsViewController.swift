//
//  RewardsViewController.swift
//  Crumbelievable Mobile App
//
//  Created by Zakary Amekran on 2/14/24.
//
//COME BACK AND FIX 
import UIKit
let shapeLayer = CAShapeLayer()
class RewardsViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var pointsNumber: UILabel!
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchData(username: nameUser, password: wordPass){ result in
            switch result {
            case .success(let userData):
                rewardsPoints = userData.user.rewardPoints
                //WORKS RAHHHHHHHHHHHHHHUHH!ħú
                // Access other properties of response.user as needed
            case .failure(let error):
                print("Incorrect Username Or Password")
                print(error.localizedDescription)
            }
        }
    }
    //make a viewWillLoad for api stuff
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded into Rewards")
        welcomeLabel.text = "Welcome, \(nameUser)"
        pointsNumber.text = "\(rewardsPoints)"
        let center = CGPoint(x: 196, y: 205)
            
  
            let trackLayer = CAShapeLayer()
            
            let circularPath = UIBezierPath(arcCenter: center, radius: 70, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
            trackLayer.path = circularPath.cgPath
            
            trackLayer.strokeColor = UIColor.lightGray.cgColor
            trackLayer.lineWidth = 10
            trackLayer.fillColor = UIColor.clear.cgColor
            trackLayer.lineCap = CAShapeLayerLineCap.round
            view.layer.addSublayer(trackLayer)
            
    //        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
            shapeLayer.path = circularPath.cgPath
            
            shapeLayer.strokeColor = UIColor.red.cgColor
            shapeLayer.lineWidth = 10
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.lineCap = CAShapeLayerLineCap.round
            
            shapeLayer.strokeEnd = 0
            
            view.layer.addSublayer(shapeLayer)
            
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        }
        
        @objc private func handleTap() {
            print("Attempting to animate stroke")
            
            let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
            
            basicAnimation.toValue = 1
            
            basicAnimation.duration = 2
            
            basicAnimation.fillMode = CAMediaTimingFillMode.forwards
            basicAnimation.isRemovedOnCompletion = false
            
            shapeLayer.add(basicAnimation, forKey: "urSoBasic")
        }
  
    }
    

