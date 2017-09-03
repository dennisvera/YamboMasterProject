// For License please refer to LICENSE file in the root of Persei project

import UIKit

class MenuCell: UICollectionViewCell {
    
    // MARK: - Init
    fileprivate func commonInit() {
        backgroundView = UIView()
        
        let views = ["titleLabel": titleLabel ,"imageView": imageView, "shadowView": shadowView]
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        contentView.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "|[imageView]|",
                options: [],
                metrics: nil,
                views: views
            )
        )
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "TrendSansOne", size: 9)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        contentView.addSubview(titleLabel)
        contentView.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "|[titleLabel]|",
                options: [],
                metrics: nil,
                views: views
            )
        )
        
        contentView.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-[imageView(38)]-14-[titleLabel]-|",
                options: [.alignAllCenterX],
                metrics: nil,
                views: views
            )
        )
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        
        object = nil
    }
    
    // MARK: - ShadowView
    fileprivate let shadowView = UIView()
    
    // MARK: - ImageView
    fileprivate let imageView = UIImageView()
    
    // MARK: - Title
    fileprivate var titleLabel = UILabel()
    
    // MARK: - Object
    var object: MenuItem? {
        didSet {
            titleLabel.text = object?.name
            imageView.image = object?.image
            imageView.highlightedImage = object?.highlightedImage
//          shadowView.backgroundColor = object?.shadowColor
            
            updateSelectionVisibility()
        }
    }
    
    // MARK: - Selection
    fileprivate func updateSelectionVisibility() {
        imageView.isHighlighted = isSelected
        backgroundView?.backgroundColor = isSelected ? object?.highlightedBackgroundColor : object?.backgroundColor
    }
    
    override var isSelected: Bool {
        didSet {
            updateSelectionVisibility()
        }
    }
}
