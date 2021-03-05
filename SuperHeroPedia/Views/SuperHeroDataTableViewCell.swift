//
//  SuperHeroDataTableViewCell.swift
//  SuperHeroPedia
//
//  Created by IDS Comercial on 05/03/21.
//  Copyright © 2021 Americo MQ. All rights reserved.
//

import UIKit

class SuperHeroDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var publisherLbl: UILabel!
    @IBOutlet weak var shImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
