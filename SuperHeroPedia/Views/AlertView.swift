//
//  AlertView.swift
//  SuperHeroPedia
//
//  Created by IDS Comercial on 28/02/21.
//  Copyright © 2021 Americo MQ. All rights reserved.
//

import Foundation
import UIKit

class AlertView: UIView {
    
    static let instance = AlertView()
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var successLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        img.layer.cornerRadius = 30
        img.layer.borderColor = UIColor.white.cgColor
        img.layer.borderWidth = 2
        
        alertView.layer.cornerRadius = 10
        
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    enum AlertType {
        case success
        case failure
    }
    
    func showAlert(title: String, message: String, alertType: AlertType) {
        self.successLbl.text = title
        self.messageLbl.text = message
        switch alertType {
        case .success:
            img.image = UIImage(named: "succes-icon")
            doneBtn.backgroundColor = #colorLiteral(red: 0, green: 0.7646542192, blue: 0.07190711051, alpha: 0.7972821086)
        case .failure:
            img.image = UIImage(named: "failure-image")
            doneBtn.backgroundColor = #colorLiteral(red: 0.3838928938, green: 0, blue: 0.04710242897, alpha: 0.8040794321)
        }
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        parentView.removeFromSuperview()
    }
    
}
