//
//  CyriptoTableViewCell.swift
//  mssCyriptex
//
//  Created by ahmet azak on 6.04.2024.
//

import UIKit

class CyriptoTableViewCell: UITableViewCell {

    @IBOutlet weak var lbprice: UILabel!
    @IBOutlet weak var lbname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public var item : Cyripto! {
        didSet {
            self.lbprice.text = item.price
            self.lbname.text = item.currency
        }
    }

}
