//
//  Colors.swift
//  Lesson 27 GymSport
//
//  Created by Илья Петров on 22.05.2021.
//

import UIKit

extension UIColor {
    
    static let backgroundListList = UIColor { (traitColection: UITraitCollection) -> UIColor in
        if traitColection.userInterfaceStyle == .dark {
            let color = UIColor.init(red: 52 / 255, green: 49 / 255, blue: 107 / 255, alpha: 1)
            return color
        }else {
            let color = UIColor.init(red: 224 / 255, green: 202 / 255, blue: 213 / 255, alpha: 1)
            return color
        }
    }
    
    static let backgroundFavorite = UIColor { (traitColection: UITraitCollection) -> UIColor in
        if traitColection.userInterfaceStyle == .dark {
            let color = UIColor.init(red: 52 / 255, green: 49 / 255, blue: 107 / 255, alpha: 1)
            return color
        }else {
            let color = UIColor.init(red: 235 / 255, green: 192 / 255, blue: 117 / 255, alpha: 1)
            return color
        }
    }
    
    static let textFieldViewBackground = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .dark {
            let color = UIColor.init(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
            return color
        }else {
            let color = UIColor.init(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
            return color
        }
    }
    
    static let textFieldView = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .dark {
            let color = UIColor.init(red: 0.54, green: 0.54, blue: 0.54, alpha: 0.2)
            return color
        }else {
            let color = UIColor.init(red: 0.18, green: 0.18, blue: 0.18, alpha: 0.2)
            return color
        }
        
    }

}


