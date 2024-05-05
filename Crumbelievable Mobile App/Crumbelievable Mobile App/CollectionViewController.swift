//
//  CollectionViewController.swift
//  Crumbelievable Mobile App
//
//  Created by Hassan Chahrour on 2/20/24.
//
import UIKit

var x: CGFloat = 220
struct orderIteminCart{
    func orderIteminCart(){}
    var image:UIImage?
    var qty:Int? = 0
    var name:String?
}

var OrderItems:[orderIteminCart] = []
var myitem: orderIteminCart = orderIteminCart()
let  dropDown = UILabel()
var coffeeSelected:Bool = true
class CollectionViewController: UICollectionViewController {
    
    
    @IBOutlet var myCollectionView: UICollectionView!
    var sideVC = sideviewViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 0.45, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .transitionFlipFromLeft) {
            
            UIView.transition(with: self.view, duration: 0.5, options: .transitionFlipFromLeft, animations: nil)
            self.collectionView.reloadData()
            self.collectionView.register(CellsClass.nib(),forCellWithReuseIdentifier: "Cell1")
            self.collectionView.collectionViewLayout = self.setLayout(x)
            self.collectionView.setCollectionViewLayout(self.setLayout(x), animated: true)
            self.navigationItem.leftBarButtonItem?.isHidden = true
            //addChildVC()
            self.navigationItem.rightBarButtonItem?.isSelected = false
            //self.view.addSubview(UIImageView(image: UIImage(named: "crumbelieveable black bkg")))
            self.sideVC.delegate = self
            self.myCollectionView.backgroundView = UIImageView(image:UIImage(named: "crumbelieveable 4"))
        }
    }
    
    func addChildVC(){
        //addChild(sideVC)
        //view.addSubview(sideVC.view)
        //self.view.insertSubview(sideVC.view, aboveSubview: myCollectionView)
        sideVC.didMove(toParent: self)
        //self.view.bringSubviewToFront(myCollectionView)
        myCollectionView.preservesSuperviewLayoutMargins = true
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return menuImages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellsClass.identifier, for: indexPath) as! CellsClass
        //cell.loadImages(with:UIImage(named: "menuItems1")!)
        //let tap = UITapGestureRecognizer(target: self, action: #selector(self.collectionView1))
        //cell.addGestureRecognizer(tap)
        cell.menuItemsSelected.image = menuImages[indexPath.item]
        //cell.menuItemsSelected.layer.cornerRadius = cell.menuItemsSelected.frame.size.width
        //cell.menuItemsSelected.clipsToBounds = true
        cell.toCheckoutButton.setTitle(menuButtons[indexPath.item], for: cell.toCheckoutButton.state)
        //cell.toCheckoutButton.tag = indexPath.row
        if menuImages.count == 2{
            
            if(indexPath.row==0){
                let tap = UITapGestureRecognizer(target: self, action: #selector(self.collectionView1))
                cell.addGestureRecognizer(tap)
                cell.toCheckoutButton.tag = indexPath.row
                //cell.toCheckoutButton.addTarget(self, action: #selector(self.collectionView1), for: .touchUpInside)
            }else if(indexPath.row==1){
                let tap = UITapGestureRecognizer(target: self, action: #selector(self.collectionView2))
                cell.addGestureRecognizer(tap)
                cell.toCheckoutButton.tag = indexPath.row
                //cell.toCheckoutButton.addTarget(self, action: #selector(self.collectionView2), for: .touchUpInside)
            }
        }else{
            let tap = UITapGestureRecognizer(target: self, action: #selector(collectionView123))
            cell.addGestureRecognizer(tap)
            //cell.toCheckoutButton.addTarget(self, action: #selector(collectionView123), for: .touchUpInside)
            
        }
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return true
    }
    
    @objc func collectionView123(sender:UITapGestureRecognizer){
        //performSegue(withIdentifier: "toCustomize", sender: (Any).self)
        let you = sender.view as! CellsClass
        myitem.image = you.menuItemsSelected.image!
        //uc.customizeImage.image = sender.view?.subviews[1] as! UIImage
        let uc = self.storyboard?.instantiateViewController(identifier: "hi") as! CustomizationController
        //let uc = CustomizationController()
        let imageview = UIImageView(image: UIImage(named: "imgonline-com-ua-resize-g0R1b7YQ9NuSSo")!)
        imageview.alpha = 0.1
        self.view.backgroundColor = .white
        self.view.addSubview(imageview)
        uc.view.addSubview(imageview)
        self.view.insertSubview(uc.view, aboveSubview: myCollectionView)
        uc.view.isHidden = false
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn){
            //self.myCollectionView.frame.origin.x = self.myCollectionView.frame.size.width-140
            self.navigationController?.navigationBar.isHidden = true
            self.tabBarController?.tabBar.isHidden = true
            self.view.subviews[1].bringSubviewToFront(uc.view)
            //self.view.sendSubviewToBack(self.myCollectionView)
            //self.myCollectionView.frame.origin.x = self.myCollectionView.frame.size.width+140
            //uc.view.frame = CGRect(x: 140,y: 0,width: 320, height: 270)
            uc.view.layer.cornerRadius=15.0
            self.myCollectionView.isUserInteractionEnabled = false
            self.navigationItem.rightBarButtonItem?.isSelected = true
            self.view.sendSubviewToBack(self.myCollectionView)
            uc.me = you.menuItemsSelected.image
            uc.view.addSubview(UIImageView(image: uc.me))
            uc.view.subviews[1].frame = CGRect(x: 100, y: 100, width: 200, height: 200)
            let lbl1 = UILabel()
            lbl1.frame = CGRect(x: 40, y: 400, width: 200, height: 200)
            lbl1.text = "Qty"
            uc.view.addSubview(lbl1)
            let lbl2 = UILabel()
            lbl2.frame = CGRect(x: 40, y: 450, width: 200, height: 200)
            lbl2.text = "Milk"
            uc.view.addSubview(lbl2)
            let lbl3 = UILabel()
            lbl3.frame = CGRect(x: 40, y: 500, width: 200, height: 200)
            lbl3.text = "Add-Ons"
            uc.view.addSubview(lbl3)
            
            let astep = UIStepper(frame: CGRect(x: 270, y: 488, width: 20, height: 30))
            uc.view.addSubview(astep)
            astep.maximumValue = 20
            astep.stepValue = 1
            astep.value = 1
            
            dropDown.frame =  CGRect(x: 115, y: 488, width: 80, height: 30)
            dropDown.text = String(Int(astep.value))
            dropDown.layer.borderWidth = 1
            dropDown.layer.cornerRadius = 14
            dropDown.textAlignment = .center
            astep.addTarget(self, action: #selector(self.step), for: .touchUpInside)
            //dropDown.didSelect{(selectedText , index ,id) in dropDown.text = "Selected String: \(selectedText) \n index: \(index)"}
            let color = {(action:UIAction) in self.hek()  }
            let  dropDown1 = UIButton(frame: CGRect(x: 115, y: 538, width: 250, height: 30))
            dropDown1.menu = UIMenu(children: [UIAction(title: "Milk",handler: color)])
            dropDown1.showsMenuAsPrimaryAction = true
            dropDown1.layer.borderWidth = 1
            dropDown1.layer.cornerRadius = 14
            //dropDown.didSelect{(selectedText , index ,id) in dropDown.text = "Selected String: \(selectedText) \n index: \(index)"}
            let  dropDown2 = UIButton(frame: CGRect(x: 115, y: 538, width: 250, height: 30))
            let milk = UILabel(frame: CGRect(x: 150, y: 538, width: 250, height: 30))
            milk.text = ""
            let actionClosure = { (action: UIAction) in
                milk.text = action.title}
            dropDown2.menu = UIMenu(children: [UIAction(title: "2% Milk",handler: actionClosure),UIAction(title: "Almond Milk",handler: actionClosure),UIAction(title: "Oat Milk",handler: actionClosure),UIAction(title: "Whole Milk",handler: actionClosure),UIAction(title: "Half-Half",handler: actionClosure)])
            
            //dropDown2.setTitle(dropDown2.menu?.child, for: .selected)
            dropDown2.showsMenuAsPrimaryAction = true
            dropDown2.changesSelectionAsPrimaryAction = true
            dropDown2.layer.borderWidth = 1
            dropDown2.layer.cornerRadius = 14
            //dropDown.didSelect{(selectedText , index ,id) in dropDown.text = "Selected String: \(selectedText) \n index: \(index)"}*/
            let  dropDown3 = UITextField(frame: CGRect(x: 115, y: 580, width: 250, height: 100))
            dropDown3.layer.borderWidth = 1
            dropDown3.layer.cornerRadius = 14
            dropDown3.textAlignment = .left
            
            if (coffeeSelected==false){
                lbl2.text = "Toppings"
                dropDown2.menu = UIMenu(children: [UIAction(title: "Sprinkles",handler: actionClosure),UIAction(title: "Cinnamon",handler: actionClosure),UIAction(title: "Marshmallows",handler: actionClosure),UIAction(title: "Hazlenuts Spread",handler: actionClosure)])
            }
            
            uc.view.addSubview(dropDown)
            uc.view.addSubview(dropDown1)
            uc.view.addSubview(dropDown2)
            uc.view.addSubview(dropDown3)
            uc.view.addSubview(milk)
            
            let  addtocart = UIButton()
            var menuItems: [UIAction] {
                return [
                    UIAction(title: "Standard item", image: UIImage(systemName: "sun.max"), handler: { (_) in
                    }),
                    UIAction(title: "Disabled item", image: UIImage(systemName: "moon"), attributes: .disabled, handler: { (_) in
                    }),
                    UIAction(title: "Delete..", image: UIImage(systemName: "trash"), attributes: .destructive, handler: { (_) in
                    })
                ]
            }

            var demoMenu: UIMenu {
                return UIMenu(title: "My menu", image: nil, identifier: nil, options: [], children: menuItems)
            }
            //addtocart.menu = demoMenu
            uc.view.addSubview(addtocart)
            addtocart.frame = CGRect(x: 76, y: 700, width: 250, height: 40)
            addtocart.layer.borderWidth = 6
            addtocart.layer.borderColor = CGColor(red: 179/255, green: 206/255, blue: 202/255, alpha: 0.7)
            addtocart.layer.cornerRadius = 24
            addtocart.layer.backgroundColor = CGColor(red: 179/255, green: 206/255, blue: 202/255, alpha: 0.3)
            addtocart.showsMenuAsPrimaryAction = true
            addtocart.setTitle("Add to Cart", for: .normal)
            addtocart.setTitleColor(.black, for: .normal)
            addtocart.addTarget(Any?.self, action: #selector(self.addtocart1), for: .touchUpInside)
            
            myitem.qty = Int(dropDown.text!)
            myitem.name = "hi"
            let bbbb = UIButton(frame: CGRect(x: 20, y: 50, width: 20, height: 30))
            uc.view.addSubview(bbbb)
            bbbb.addTarget(Any?.self, action: #selector(self.backtomenu), for: .touchUpInside)
            bbbb.setImage(UIImage(systemName:"arrow.uturn.backward"), for: .normal)
            }completion: { done in
                if done{
                    
                }
            }
        }
    
    func hek(){
        
    }
    @objc func step(_ sender:UIStepper){
        dropDown.text  = String(Int(sender.value))
        myitem.qty = Int(sender.value)}
    
    func setLayout(_ x: CGFloat) -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: 180, height: 180)
        layout.sectionInset = UIEdgeInsets(top: x ,left: 5,bottom: 70,right: 5)
        
        return layout
    }
    func setLayout2(_ x: CGFloat) -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: 180, height: 180)
        layout.sectionInset = UIEdgeInsets(top: x ,left: 5,bottom: 70,right: 5)
        
        return layout
    }
    
    
    @objc func addtocart1() {
        var counter:Int = 0
        var counter2 :Int =  myitem.qty!
        if (OrderItems.count==0){
            OrderItems.append(myitem)
            OrderItems[0].qty = myitem.qty
        }else{
            for i in 0 ..< OrderItems.count{
                if myitem.image?.pngData()==OrderItems[i].image?.pngData(){
                    counter2+=1
                    OrderItems[i].qty = counter2
                }else{
                    counter+=1
                }
            }
            if counter==OrderItems.count{
                OrderItems.append(myitem)
            }
        }
    }
    @objc func backtomenu() {
        self.view.subviews[1].isHidden = true
        self.view.bringSubviewToFront(self.myCollectionView)
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = false
        self.navigationItem.rightBarButtonItem?.isSelected = false
        self.myCollectionView.isUserInteractionEnabled = true
    }
    
    @objc func collectionView1() {
        x=50
        menuImages = [UIImage(named:"Ground-breaking 1")!,UIImage(named:"Memorable design")!,UIImage(named:"My new creation 1")!,UIImage(named:"My new creation")!,UIImage(named:"Something new 2")!,UIImage(named:"Something new 3")!]
        menuButtons = sweets
        viewDidLoad()
        self.navigationItem.leftBarButtonItem?.isHidden = false
        coffeeSelected = false
    }
    
    @objc func collectionView2() {
        x=50
        menuImages = [UIImage(named:"espresso")!,UIImage(named:"cortado")!,UIImage(named:"cortado")!,UIImage(named:"americano")!,UIImage(named:"americano")!,UIImage(named:"mocha")!]
        menuButtons = coffee
        viewDidLoad()
        self.navigationItem.leftBarButtonItem?.isHidden = false
        coffeeSelected = true
    }
    
    @IBAction func Back() {
        menuImages = [UIImage(named:"Image.png")!,UIImage(named:"MenuItems1.png")!]
        menuButtons = ["Cookies", "Coffee"]
        x = 220
        viewDidLoad()
        self.myCollectionView.isUserInteractionEnabled = true
        coffeeSelected = true
    }
    
    @IBAction func cart(){
        if self.navigationItem.rightBarButtonItem?.isSelected == false{
            self.view.insertSubview(sideVC.view, aboveSubview: myCollectionView)
            self.sideVC.view.isHidden = false
            self.sideVC.tableView.reloadData()
            if menuImages.count != 2{
                self.collectionView.collectionViewLayout = self.setLayout(88)}else{
                self.collectionView.collectionViewLayout = self.setLayout(258)
                }
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 4, options: .transitionFlipFromRight){
                //self.myCollectionView.frame.origin.x = self.myCollectionView.frame.size.width-140
                self.navigationController?.navigationBar.isHidden = true
                self.tabBarController?.tabBar.isHidden = true
                self.view.subviews[1].bringSubviewToFront(self.sideVC.view)
                //self.view.sendSubviewToBack(self.myCollectionView)
                //self.myCollectionView.frame.origin.x = self.myCollectionView.frame.size.width+140
                self.sideVC.view.frame = CGRect(x: 140,y: 0,width: 320, height: 800)
                self.sideVC.view.layer.cornerRadius=15.0
                self.myCollectionView.isUserInteractionEnabled = false
                self.navigationItem.rightBarButtonItem?.isSelected = true
            }completion: { done in
                if done{
                    
                }
            }
        }else{
            sideVC.view.isHidden = true
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 4, initialSpringVelocity: 2, options: .transitionFlipFromRight){
                self.myCollectionView.frame.origin.x = 0
                //self.view.bringSubviewToFront(self.sideVC.view)
                //self.view.sendSubviewToBack(self.myCollectionView)
                //self.myCollectionView.frame.origin.x = self.myCollectionView.frame.size.width+140
                self.sideVC.view.frame = CGRect(x: 0,y: 0,width: self.sideVC.view.frame.size.width+140, height: 300)
                self.myCollectionView.isUserInteractionEnabled = true
                self.navigationItem.rightBarButtonItem?.isSelected = false
                self.tabBarController?.tabBar.isHidden = false
                //self.tabBarController?.tabBar.isTranslucent = true
            }completion: { done in
                if done{
                    
                }
            }
        }
    }
}

extension CollectionViewController: sideviewViewControllerDelegate {
    func collectionView12() {
        self.myCollectionView.frame.origin.x = 0
        self.myCollectionView.isUserInteractionEnabled = true
        self.navigationItem.rightBarButtonItem?.isSelected = false
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = false
        self.collectionView.collectionViewLayout = self.setLayout(x)
    }
    func collectionView122() {
        performSegue(withIdentifier: "toOrder", sender: (Any).self)
    }
}
