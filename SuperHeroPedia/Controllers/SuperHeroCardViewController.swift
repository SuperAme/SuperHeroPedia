//
//  SuperHeroCardViewController.swift
//  SuperHeroPedia
//
//  Created by IDS Comercial on 08/03/21.
//  Copyright © 2021 Americo MQ. All rights reserved.
//

import Foundation
import UIKit

class SuperHeroCardViewController: UIViewController {
    
    var imageValue: String?
    var nameValue: String?
    var slugValue: String?
    var fullNamevalue: String?
    var alignValue: String?
    
    @IBOutlet weak var imageCard: UIImageView!
    @IBOutlet weak var nameCard: UILabel!
    @IBOutlet weak var slugCard: UILabel!
    @IBOutlet weak var fullNameCard: UILabel!
    @IBOutlet weak var alignmentCard: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: imageValue ?? "") {
            if let data = try? Data(contentsOf: url) {
                imageCard.image = UIImage(data: data)
            }
        }
        nameCard.text = nameValue ?? "No data"
        slugCard.text = slugValue ?? "No data"
        fullNameCard.text = fullNamevalue ?? "No data"
        alignmentCard.text = alignValue ?? "No data"
    }
}
