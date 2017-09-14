//
//  MarketplaceDataSource.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/14/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class MarketplaceDataSource {
    fileprivate var marketplace: [MarketPlace] = []
    
    var count: Int {
        return marketplace.count
    }
    
    init() {
        marketplace = loadMarketplaceFromDisk()
    }
    
    func marketplaceForItemAtIndexPath(_ indexPath: IndexPath) -> MarketPlace? {
            return marketplace[(indexPath as NSIndexPath).item]
    }
    
    // MARK: - Private
    
    fileprivate func loadMarketplaceFromDisk() -> [MarketPlace] {
        if let path = Bundle.main.path(forResource: "Marketplace", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                var marketplaceArray: [MarketPlace] = []
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let resident = dict["resident"] as! String
                        let itemPhoto = dict["itemPhoto"] as! String
                        let itemDetail = dict["itemDetail"] as! String
                        let itemPrice = dict ["itemPrice"] as! String
                        let marketplace = MarketPlace(resident: resident, itemPhoto: itemPhoto, itemDetail: itemDetail, itemPrice: itemPrice)
                        
                        marketplaceArray.append(marketplace)
                    }
                }
                return marketplaceArray
            }
        }
        return []
    }
    
}
