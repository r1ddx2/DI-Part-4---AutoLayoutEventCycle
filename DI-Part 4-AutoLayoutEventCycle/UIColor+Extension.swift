//
//  UIColor+Extension.swift
//  DI-Part 4-AutoLayoutEventCycle
//
//  Created by Red Wang on 2023/10/25.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: Float = 1.0) {
        
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    static let yellowCircleColor = UIColor(red: 255, green: 204, blue: 1)
    static let purpleCircleColor = UIColor(red: 88, green: 86, blue: 214)
    static let redCircleColor = UIColor(red: 255, green: 44, blue: 85)
}
