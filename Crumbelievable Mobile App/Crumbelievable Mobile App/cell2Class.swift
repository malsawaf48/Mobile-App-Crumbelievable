//
//  cell2class.swift
//  Crumbelievable Mobile App
//
//  Created by Hassan Chahrour on 3/27/24.
//

import UIKit

class cell2class: UITableViewCell {
    static let identifier = "Cell2"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "cell2class", bundle: nil)
    }
}
