//
//  SuperHeroData.swift
//  SuperHeroPedia
//
//  Created by IDS Comercial on 04/03/21.
//  Copyright © 2021 Americo MQ. All rights reserved.
//

import Foundation

struct SuperHeroData: Codable {
    let name: String?
    let images: imageStruct
    let biography: Publisher
}

struct imageStruct: Codable {
    let xs: String?
}

struct Publisher: Codable {
    let publisher: String?
}
