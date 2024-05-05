//
//  CellsClass.swift
//  Crumbelievable Mobile App
//
//  Created by Hassan Chahrour on 2/22/24.
//

import UIKit

struct Order{
    var nameOfItem:String
    var qtyOfItem:Int
    var priceOfItem:Double
}

var menuImages: [UIImage] = [UIImage(named:"Image.png")!,UIImage(named:"MenuItems1.png")!]
var menuButtons: [String] = ["Cookies", "Coffee"]
var sweets: [String] = ["Chips", "Sprinkles","Red Cream","Swirl","Zesty","Moose"]
var coffee: [String] = ["Espresso", "Cortado","Latte","Americano","Lungo","Mocha"]
var order: [Order] = []

class CellsClass: UICollectionViewCell {
    
    @IBOutlet weak var toCheckoutButton: UIButton!
    @IBOutlet weak var menuItemsSelected: UIImageView!
    
    static let identifier = "Cell1"
    
    func loadImages (with menuItem:UIImage){
        menuItemsSelected.image = menuItem
    }
    
    /*override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        toCheckoutButton.setTitle("Yum!", for: .highlighted)
        toCheckoutButton.setTitleColor(.black, for: .normal)
        toCheckoutButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        toCheckoutButton.titleLabel?.font = UIFont.init(name: "AmericanTypewriter", size: 18)
        toCheckoutButton.titleShadowColor(for: .normal)
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 20
        self.layer.borderColor = CGColor(red: 0.20, green: 0.6, blue: 0.6, alpha: 0.65)
        self.layer.shadowOpacity = 100
        self.layer.shadowColor = CGColor(red: 0.20, green: 0.6, blue: 0.6, alpha: 1)
        //self.contentView.backgroundColor = UIColor(red: 94/256, green: 210/256, blue: 210/256, alpha: 0.5)
        //self.contentView.focusEffect.a
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CellsClass", bundle: nil)
    }
    

}
