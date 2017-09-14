//
//  MarketPlace.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/14/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class MarketPlace {
    
    var resident: String
    var itemPhoto: String
    var itemDetail: String
    var itemPrice: String
    
    init(resident: String, itemPhoto: String, itemDetail: String, itemPrice: String) {
        self.resident = resident
        self.itemPhoto = itemPhoto
        self.itemDetail = itemDetail
        self.itemPrice = itemPrice
    }
    
    convenience init(copying marketplace: MarketPlace) {
        self.init(resident: marketplace.resident, itemPhoto: marketplace.itemPhoto, itemDetail: marketplace.itemDetail, itemPrice: marketplace.itemPrice)
    }
}

