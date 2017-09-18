//
//  MarketplaceDetailView2.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/18/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

private let nibName = "MarketDetail2View"

class MarketDetail2View: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet var itemImageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

}
