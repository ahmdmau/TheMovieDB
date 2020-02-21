//
//  UIImageview+Extension.swift
//  TheMovieDB
//
//  Created by Ahmad Maulana on 21/02/20.
//  Copyright © 2020 Ahmad Maulana. All rights reserved.
//

import Foundation
import UIKit
import ImageIO

extension UIImageView{
    public func roundCorner(_ corners: UIRectCorner, radius: CGFloat){
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}
