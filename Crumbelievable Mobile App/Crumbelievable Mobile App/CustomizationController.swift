//
//  CustomizationController.swift
//  Crumbelievable Mobile App
//
//  Created by Hassan Chahrour on 4/8/24.
//

import UIKit
protocol CustomizationControllerDelegate: CollectionViewController{
    func collectionView123(_:Any?)->CellsClass
}
class CustomizationController: UIViewController {
    @IBOutlet weak var cutomize: UIImageView!
    weak var delegate : CustomizationControllerDelegate?
    var me:UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
