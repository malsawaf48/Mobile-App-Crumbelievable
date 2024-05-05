//
//  sideviewViewController.swift
//  Crumbelievable Mobile App
//
//  Created by Hassan Chahrour on 3/25/24.
//

import UIKit

protocol sideviewViewControllerDelegate: CollectionViewController{
    func collectionView12()
    func collectionView122()
}
class sideviewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    weak var delegate: sideviewViewControllerDelegate?
    let tableView: UITableView = {
        let table1 = UITableView()
        table1.backgroundColor = nil
        table1.register(UITableViewCell.self, forCellReuseIdentifier: "Cell2")
        //cell.addSubview(UIImageView(image: menuImages[indexPath.item]))
        return table1
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.isHidden = true
        view.backgroundColor = UIColor(cgColor: CGColor(red: 179/255, green: 206/255, blue: 202/255, alpha: 0.9))
        //UIColor(red: 94/255, green: 210/255, blue: 210/255, alpha: 0.5)
        // Do any additional setup after loading the view.
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x:0,y: self.view.frame.origin.y+177,width: view.bounds.size.width,height: view.bounds.size.height)
        self.view.addSubview(UIImageView(image: UIImage(named: "crumbelieveable teal")))
        self.view.subviews[1].frame = CGRect(x:0,y: self.view.frame.origin.y+80,width: view.bounds.size.width-140,height: 70)
        self.view.addSubview(UIImageView(image: UIImage(systemName: "line.horizontal.3")))
        self.view.subviews[2].frame = CGRect(x:215,y: self.view.frame.origin.y+55,width: view.bounds.size.width-360,height: 20)
        self.view.subviews[2].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.collectionView12)))
        self.view.subviews[2].isUserInteractionEnabled = true
        let bob = UIButton(frame: CGRect(x:25,y: 750,width: 220,height: 20))
        self.view.addSubview(bob)
        self.view.subviews[3].layer.borderWidth = 3
        self.view.subviews[3].layer.borderColor = CGColor(red: 179/255, green: 206/255, blue: 202/255, alpha: 0.6)
        self.view.subviews[3].layer.backgroundColor = CGColor(red: 179/255, green: 206/255, blue: 202/255, alpha: 0.6)
        self.view.subviews[3].layer.cornerRadius = 34
        bob.setTitle("Review Order", for: .normal)
        bob.addTarget(self, action: #selector(checkmeout), for: .touchUpInside)
        //tableView.tableFooterView = bob
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return OrderItems.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
            cell.imageView?.image = OrderItems[indexPath.item].image
            cell.textLabel?.text = "custom item"
            let del = UIButton(frame: CGRect(x: 220, y: 13, width: 20, height: 20))
            //del.layer.borderWidth = 40
            del.setImage(UIImage(systemName: "x.circle"), for: .normal)
            del.addTarget(self, action: #selector(deleteCartItem), for: .touchUpInside)
            del.tag = indexPath.row
            cell.contentView.addSubview(del)
            cell.backgroundColor = nil
            let tap = UIGestureRecognizer()
            cell.addGestureRecognizer(tap)
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        @objc func collectionView12() {
            self.view.isHidden = true
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut){
                //self.view.bringSubviewToFront(self.sideVC.view)
                //self.view.sendSubviewToBack(self.myCollectionView)
                //self.myCollectionView.frame.origin.x = self.myCollectionView.frame.size.width+140
                self.view.frame = CGRect(x: 0,y: 0,width: self.view.frame.size.width+140, height: 300)
                self.navigationItem.rightBarButtonItem?.isSelected = false
            }completion: { done in
                if done{
                    
                }
            }
            delegate?.collectionView12()
        }
    
    @objc func deleteCartItem(_ sender:UIButton) {
        let indexpath = sender.tag
        OrderItems.remove(at: indexpath)
        tableView.reloadData()
    }
    
    @objc func checkmeout() {
        //let VC1 = ShowMeTheMoney()
        //let navController = UINavigationController(rootViewController: VC1) // Creating a navigation controller with VC1 at the root of the navigation stack.
        //self.present(navController, animated:true, completion: nil)
        
        delegate?.collectionView122()
    }
}
