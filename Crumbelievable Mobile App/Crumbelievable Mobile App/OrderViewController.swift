//
//  OrderViewController.swift
//  Crumbelievable Mobile App
//
//  Created by Zakary Amekran on 2/14/24.
//

import UIKit

class OrderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    let tableView: UITableView = {
        let table1 = UITableView()
        table1.backgroundColor = nil
        table1.register(UITableViewCell.self, forCellReuseIdentifier: "Cell2")
        //cell.addSubview(UIImageView(image: menuImages[indexPath.item]))
        return table1
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageview = UIImageView(image: UIImage(named: "imgonline-com-ua-resize-g0R1b7YQ9NuSSo")!)
        imageview.alpha = 0.1
        self.view.backgroundColor = .white
        self.view.addSubview(imageview)
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x:16,y: 131,width: 361,height: 361)
        let bob = UIButton(frame: CGRect(x:90,y: 650,width: 220,height: 20))
        self.view.addSubview(bob)
        self.view.subviews[2].layer.borderWidth = 3
        self.view.subviews[2].layer.borderColor = CGColor(red: 179/255, green: 206/255, blue: 202/255, alpha: 0.6)
        self.view.subviews[2].layer.backgroundColor = CGColor(red: 179/255, green: 206/255, blue: 202/255, alpha: 0.6)
        self.view.subviews[2].layer.cornerRadius = 34
        self.view.subviews[3].layer.borderWidth = 3
        self.view.subviews[3].layer.borderColor = CGColor(red: 179/255, green: 206/255, blue: 202/255, alpha: 0.6)
        self.view.subviews[3].layer.backgroundColor = CGColor(red: 179/255, green: 206/255, blue: 202/255, alpha: 0.6)
        self.view.subviews[3].layer.cornerRadius = 34
        bob.setTitle("Checkout", for: .normal)
        bob.addTarget(self, action: #selector(payPressed), for: .touchUpInside)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return OrderItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
        cell.imageView?.image = OrderItems[indexPath.item].image
        cell.textLabel?.text = "custom item"
        let amount = UILabel(frame: CGRect(x: 250, y: 13, width: 100, height: 20))
        amount.text = "x\(OrderItems[indexPath.item].qty!)"
        cell.contentView.addSubview(amount)
        let del = UIButton(frame: CGRect(x: 310, y: 13, width: 20, height: 20))
        //del.layer.borderWidth = 40
        del.setImage(UIImage(systemName: "x.circle"), for: .normal)
        del.addTarget(self, action: #selector(deleteCartItem), for: .touchUpInside)
        del.tag = indexPath.row
        cell.contentView.addSubview(del)
        cell.backgroundColor = UIColor(cgColor: CGColor(red: 0.35, green: 0.81, blue: 0.81, alpha: 0.1))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    @objc func payPressed() {
        performSegue(withIdentifier: "toPayment",sender: UIGestureRecognizer())
    }
    
    @objc func deleteCartItem(_ sender:UIButton) {
        let indexpath = sender.tag
        OrderItems.remove(at: indexpath)
        tableView.reloadData()
    }
    
    
}
