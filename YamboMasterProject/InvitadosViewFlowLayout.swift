//
//  InvitadosViewFlowLayout.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/12/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class InvitadosViewFlowLayout: UICollectionViewFlowLayout {
    
    var appearingIndexPath: IndexPath?
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        guard let attributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath), let indexPath = appearingIndexPath, indexPath == itemIndexPath else {
            return nil
        }
        
        attributes.alpha = 1.0
        attributes.center = CGPoint(x: collectionView!.frame.width - 23.5, y: -24.5)
        attributes.transform = CGAffineTransform(scaleX: 0.15, y: 0.15)
        attributes.zIndex = 5
        
        return attributes
    }

}
