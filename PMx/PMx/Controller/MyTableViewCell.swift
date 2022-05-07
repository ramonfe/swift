//
//  MyTableViewCell.swift
//  PMx
//
//  Created by home on 04/04/22.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var actorsDescLabel: UILabel!
    @IBOutlet weak var dateFixLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var criticFixLabel: UILabel!
    @IBOutlet weak var criticLabel: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        //para que permita que la descripcion sea de mas de 1 renglon
        //actorsDescLabel.numberOfLines=0
        actorsLabel.text = NSLocalizedString("actorslabel", comment: "")
        dateFixLabel.text = NSLocalizedString("datelabel", comment: "")
        criticFixLabel.text = NSLocalizedString("criticlabel", comment: "")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
