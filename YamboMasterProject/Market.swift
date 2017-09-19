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
    var thumbnailImage1: String
    var thumbnailImage2: String
    var thumbnailImage3: String
    var thumbnailImage4: String
    var thumbnailImage5: String
    var thumbnailImage6: String

    
    init(resident: String, itemImage: String, itemDetail: String, itemPrice: String, itemDescription: String, thumbnailImage1: String, thumbnailImage2: String, thumbnailImage3: String, thumbnailImage4: String, thumbnailImage5: String, thumbnailImage6: String
) {
        self.resident = resident
        self.itemImage = itemImage
        self.itemDetail = itemDetail
        self.itemPrice = itemPrice
        self.itemDescription = itemDescription
        self.thumbnailImage1 = thumbnailImage1
        self.thumbnailImage2 = thumbnailImage2
        self.thumbnailImage3 = thumbnailImage3
        self.thumbnailImage4 = thumbnailImage4
        self.thumbnailImage5 = thumbnailImage5
        self.thumbnailImage6 = thumbnailImage6
    }
    
    convenience init(copying market: Market) {
        self.init(resident: market.resident, itemImage: market.itemImage, itemDetail: market.itemDetail, itemPrice: market.itemPrice, itemDescription: market.itemDescription, thumbnailImage1: market.thumbnailImage1, thumbnailImage2: market.thumbnailImage2, thumbnailImage3: market.thumbnailImage3, thumbnailImage4: market.thumbnailImage4, thumbnailImage5: market.thumbnailImage5, thumbnailImage6: market.thumbnailImage6)
    }
}

