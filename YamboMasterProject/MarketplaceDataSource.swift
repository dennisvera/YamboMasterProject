//
//  MarketplaceDataSource.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/14/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class MarketplaceDataSource {
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
                        let market = Market(resident: resident, itemImage: itemImage, itemDetail: itemDetail, itemPrice: itemPrice, itemDescription: itemDescription)
                        
                        marketArray.append(market)
                    }
                }
                return marketArray
            }
        }
        return []
    }
    
}
