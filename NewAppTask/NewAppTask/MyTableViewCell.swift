//
//  MyTableViewCell.swift
//  NewAppTask
//
//  Created by Mac on 21/09/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var mylabel2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }
}
