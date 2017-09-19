//
//  MarketPlace.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/14/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class Market {
    
    var resident: String
    var itemImage: String
    var itemDetail: String
    var itemPrice: String
    var itemDescription: String
    
    init(resident: String, itemImage: String, itemDetail: String, itemPrice: String, itemDescription: String) {
        self.resident = resident
        self.itemImage = itemImage
        self.itemDetail = itemDetail
        self.itemPrice = itemPrice
        self.itemDescription = itemDescription
    }
    
    convenience init(copying market: Market) {
        self.init(resident: market.resident, itemImage: market.itemImage, itemDetail: market.itemDetail, itemPrice: market.itemPrice, itemDescription: market.itemDescription)
    }
}

