// For License please refer to LICENSE file in the root of Persei project

import UIKit
import Foundation

public struct MenuItem {
    
    public var name: String?
    public var image: UIImage?
    public var highlightedImage: UIImage?
    
    public var backgroundColor = UIColor.clear
    public var highlightedBackgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
    
    public var shadowColor = UIColor(white: 0.1, alpha: 0.3)
    
    // MARK: - Init
    
    public init(name: String? = nil, image: UIImage? = nil, highlightedImage: UIImage? = nil) {
        self.name = name
        self.image = image
        self.highlightedImage = highlightedImage
    }
    
}


