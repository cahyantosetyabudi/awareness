//
//  CardView.swift
//  awareness
//
//  Created by Cahyanto Setya Budi on 11/7/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CardView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var shadowColor: UIColor? = UIColor.black {
        didSet {
            self.layer.shadowColor = shadowColor?.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: Int = 0 {
        didSet {
            self.layer.shadowOffset = CGSize(width: 0, height: 1)
        }
    }
    
    @IBInspectable var shadowOppacity: Float = 0.2 {
        didSet {
            self.layer.shadowOpacity = shadowOppacity
        }
    }
    
    @IBInspectable var border: UIColor? = UIColor.clear {
        didSet {
            self.layer.borderColor = border?.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
}
