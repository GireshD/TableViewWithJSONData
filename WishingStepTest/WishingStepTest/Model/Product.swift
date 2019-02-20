//
//  ProductCatalogue.swift
//  WishingStepTest
//
//  Created by Giresh Dora on 13/01/19.
//  Copyright © 2019 Giresh Dora. All rights reserved.
//

import Foundation

struct ProductCatalogue: Decodable {
    let results: [Products]
}

struct Products: Decodable {
    let name : String
    let manufacturer : String
    let price : Price
    let promoImageUrl : String
    let url : String
}

struct Price : Decodable {
    let formattedValue : String
}
