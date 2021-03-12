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
    var filteredDict: [SuperHeroData]!
    let heroManager = SuperHeroManager()
    
    var nameToSend: String?
    var imageURL: String?
    var slug: String?
    var fullName: String?
    var alignment: String?
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        myTableView.dataSource = self
        myTableView.delegate = self
        mySearchBar.delegate = self
        filteredDict = dict
        heroManager.parseJson {
            data in
            self.dict = data
            DispatchQueue.main.async {
                self.filteredDict = self.dict
                self.myTableView.reloadData()
            }
        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cardIdentifier" {
            let secondVC = segue.destination as! SuperHeroCardViewController
            secondVC.nameValue = nameToSend
            secondVC.imageValue = imageURL
            secondVC.fullNamevalue = fullName
            secondVC.alignValue = alignment
            secondVC.slugValue = slug
        }
    }
}
extension LandingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nameToSend = filteredDict[indexPath.row].name
        imageURL = filteredDict[indexPath.row].images.md
        slug = filteredDict[indexPath.row].slug
        fullName = filteredDict[indexPath.row].biography.fullName
        alignment = filteredDict[indexPath.row].biography.alignment
        self.performSegue(withIdentifier: "cardIdentifier", sender: self)
    }
}
extension LandingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDict.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as! SuperHeroDataTableViewCell
        cell.nameLbl.text = filteredDict[indexPath.row].name
        cell.publisherLbl.text = filteredDict[indexPath.row].biography.publisher
        
        if let url = URL(string: filteredDict[indexPath.row].images.xs ?? "") {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    cell.shImage.image = UIImage(data: data)
                }
            }
        }
        
        return cell
    }
}
extension LandingViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredDict = []
        if searchText == "" {
            filteredDict = dict
        } else {
            for heroes in dict {
                if heroes.name!.lowercased().contains(searchText.lowercased()) {
                    filteredDict.append(heroes)
                }
            }
        }
        self.myTableView.reloadData()
    }
}
