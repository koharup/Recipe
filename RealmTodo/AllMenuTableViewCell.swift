//
//  AllMenuTableViewCell.swift
//  RealmTodo
//
//  Created by kohari on 2019/10/05.
//  Copyright © 2019 kohari. All rights reserved.
//

import UIKit

class AllMenuTableViewCell: UITableViewCell {

     @IBOutlet weak var titlelabel: UILabel!
    
    @IBOutlet weak var heart1: UIImageView!
    @IBOutlet weak var heart2: UIImageView!
    @IBOutlet weak var heart3: UIImageView!
    @IBOutlet weak var heart4: UIImageView!
    @IBOutlet weak var heart5: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
