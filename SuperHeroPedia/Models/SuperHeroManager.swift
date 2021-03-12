//
//  SuperHeroManager.swift
//  SuperHeroPedia
//
//  Created by IDS Comercial on 11/03/21.
//  Copyright © 2021 Americo MQ. All rights reserved.
//

import Foundation

struct SuperHeroManager {
    func parseJson( comp : @escaping ([SuperHeroData])->()) {
        if let url = URL(string: Constants.baseURL) {
            URLSession.shared.dataTask(with: url) {
                data, response, error in
                if error != nil {
                    DispatchQueue.main.async {
                        AlertView.instance.showAlert(title: "Error", message: error!.localizedDescription, alertType: .failure)
                    }
                }
                do {
                    let result = try JSONDecoder().decode([SuperHeroData].self, from: data!)
                    comp(result)
                } catch {
                    DispatchQueue.main.async {
                        AlertView.instance.showAlert(title: "Error", message: error.localizedDescription, alertType: .failure)
                    }
                }
            }.resume()
        }
    }
}
