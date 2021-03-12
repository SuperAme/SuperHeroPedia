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
    let slug: String?
    let images: imageStruct
    let biography: Publisher
}

struct imageStruct: Codable {
    let xs: String?
    let md: String?
}

struct Publisher: Codable {
    let fullName: String?
    let publisher: String?
    let alignment: String?
}
