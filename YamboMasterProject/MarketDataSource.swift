//
//  MarketplaceDataSource.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/14/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class MarketDataSource {
    fileprivate var market: [Market] = []
    
    var count: Int {
        return market.count
    }
    
    init() {
        market = loadMarketplaceFromDisk()
    }
    
    func marketplaceForItemAtIndexPath(_ indexPath: IndexPath) -> Market? {
            return market[(indexPath as NSIndexPath).item]
    }
    
    // MARK: - Private
    
    fileprivate func loadMarketplaceFromDisk() -> [Market] {
        if let path = Bundle.main.path(forResource: "Marketplace", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                var marketArray: [Market] = []
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let resident = dict["resident"] as! String
                        let itemImage = dict["itemImage"] as! String
                        let itemDetail = dict["itemDetail"] as! String
                        let itemPrice = dict ["itemPrice"] as! String
                        let itemDescription = dict["itemDescription"] as! String
                        let thumbnailImage1 = dict["thumbnailImage1"] as! String
                        let thumbnailImage2 = dict["thumbnailImage2"] as! String
                        let thumbnailImage3 = dict["thumbnailImage3"] as! String
                        let thumbnailImage4 = dict["thumbnailImage4"] as! String
                        let thumbnailImage5 = dict["thumbnailImage5"] as! String
                        let thumbnailImage6 = dict["thumbnailImage6"] as! String

                        let market = Market(resident: resident, itemImage: itemImage, itemDetail: itemDetail, itemPrice: itemPrice, itemDescription: itemDescription, thumbnailImage1: thumbnailImage1, thumbnailImage2: thumbnailImage2, thumbnailImage3: thumbnailImage3, thumbnailImage4: thumbnailImage4, thumbnailImage5: thumbnailImage5, thumbnailImage6: thumbnailImage6)
                        
                        marketArray.append(market)
                    }
                }
                return marketArray
            }
        }
        return []
    }
    
}
