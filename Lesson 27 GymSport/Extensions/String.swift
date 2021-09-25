//
//  String.swift
//  Lesson 27 GymSport
//
//  Created by Илья Петров on 22.05.2021.
//

import UIKit

extension String {
    
    func getSymbol() -> UIImage {
        let configuration = UIImage.SymbolConfiguration.init(pointSize: 20, weight: .light, scale: .default)
        let image = UIImage.init(systemName: self, withConfiguration: configuration)
        
        return image!
    }
}
