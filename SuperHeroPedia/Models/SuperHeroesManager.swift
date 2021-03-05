//
//  SuperHeroesManager.swift
//  SuperHeroPedia
//
//  Created by IDS Comercial on 04/03/21.
//  Copyright © 2021 Americo MQ. All rights reserved.
//

import Foundation

struct SuperHeroesManager {
    func performRequest() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        URLSession.shared.dataTask(with: url!) { (data,response,error) in
            do {
                if error != nil {
                    DispatchQueue.main.async {
                        AlertView.instance.showAlert(title: "ERROR", message: error?.localizedDescription ?? "TRY LATER", alertType: .failure)
                    }
                }
                let safeData = try JSONDecoder().decode([SuperHeroModel].self, from: data!)
                print(safeData)
                
            } catch {
                
            }
        }
        
    }
    func parseJson(_ heroData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode([SuperHeroModel].self, from: heroData)
        } catch {
            DispatchQueue.main.async {
                AlertView.instance.showAlert(title: "ERROR", message: error.localizedDescription ?? "TRY LATER", alertType: .failure)
            }
        }
    }
}

//if let url = URL(string: Constants.baseURL) {
//    let session = URLSession(configuration: .default)
//    let task = session.dataTask(with: url) { (data, response, error) in
//        if error != nil {
//            DispatchQueue.main.async {
//                AlertView.instance.showAlert(title: "ERROR", message: error?.localizedDescription ?? "TRY LATER", alertType: .failure)
//            }
//
//        }
//        if let safeData = data {
//            let res = self.parseJson(safeData)
//            print(res)
//        }
//    }
//    task.resume()
//}
