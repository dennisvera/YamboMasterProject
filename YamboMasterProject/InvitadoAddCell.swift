//
//  InvitadoAddCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/16/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class InvitadoAddCell: UICollectionViewCell {
    @IBOutlet var buttonBackgroundCell: UIView!
    @IBOutlet var newInvitadoLabel: UILabel!
    fileprivate var invitadoDataSource = InvitadoDataSource()
    fileprivate var invitadoFlowLayout = InvitadosViewFlowLayout()
    let collection = InvitadoCollectionViewController()
    
    override func prepareForReuse() {
        buttonBackgroundCell = nil
        newInvitadoLabel.text = ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonBackgroundCell.layer.cornerRadius = 5
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
//        let indexPath = invitadoDataSource.indexPathForNewRandomPark()
//        
//        invitadoFlowLayout.appearingIndexPath = indexPath
//        
//        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 0.0, options: UIViewAnimationOptions(), animations: { () -> Void in
//            
//            self.collection.collectionView!.insertItems(at: [indexPath as IndexPath])
//        }, completion: { (finished: Bool) -> Void in
//            self.invitadoFlowLayout.appearingIndexPath = nil
//        })
//        
//        print("Button Clicked")
    }
    
}
