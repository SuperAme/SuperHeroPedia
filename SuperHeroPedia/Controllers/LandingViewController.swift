//
//  LandingViewController.swift
//  SuperHeroPedia
//
//  Created by IDS Comercial on 25/02/21.
//  Copyright © 2021 Americo MQ. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import Alamofire

class LandingViewController: UIViewController {
    
    var dict = [SuperHeroData]()
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        myTableView.dataSource = self
        myTableView.delegate = self
        getData()
    }
    
    @IBAction func logOutButton(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError{
            AlertView.instance.showAlert(title: "Error", message: signOutError.localizedDescription, alertType: .failure)
        }
    }
    func getData() {
        AF.request(Constants.baseURL, method: .get).responseString { (response) in
            if let data = response.data {
                self.parseJSON(data)
            }
        }
    }
    func parseJSON(_ data: Data) {
        do {
            dict = try JSONDecoder().decode([SuperHeroData].self, from: data)
            for data in dict {
                DispatchQueue.main.async {
                    self.myTableView.reloadData()
                }
            }
        } catch {
            DispatchQueue.main.async {
                AlertView.instance.showAlert(title: "Error", message: error.localizedDescription, alertType: .failure)
            }
        }
    }
}
extension LandingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if mySearchBar.isFirstResponder {
            mySearchBar.resignFirstResponder()
            myTableView.deselectRow(at: indexPath, animated: false)
            return
        }
        print(dict[indexPath.row])
    }
}
extension LandingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dict.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as! SuperHeroDataTableViewCell
        cell.nameLbl.text = dict[indexPath.row].name
        cell.publisherLbl.text = dict[indexPath.row].biography.publisher
        
        if let url = URL(string: dict[indexPath.row].images.xs ?? "") {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    cell.shImage.image = UIImage(data: data)
                }
            }
        }
        
        return cell
    }
}
