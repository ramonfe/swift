//
//  MyCustomTableViewCell.swift
//  PeliculasEnMexico
//
//  Created by home on 19/03/22.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var fstLabel: UILabel!
    @IBOutlet weak var sndLabel: UILabel!
    @IBOutlet weak var nyImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
