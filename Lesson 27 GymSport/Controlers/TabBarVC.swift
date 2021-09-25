//
//  TabBarVC.swift
//  Lesson 27 GymSport
//
//  Created by Илья Петров on 22.05.2021.
//

import UIKit

class TabBarVC: UITabBarController {
    
    
}


//MARK: -Life Cycle Controlr-
extension TabBarVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
    
    }
}

//MARK: -Configuraton-

extension TabBarVC {
    
    private func configuration() {
        self.configurationUI()
        
    }
    
    private func configurationUI() {
        self.setControlers()
    }
}

//MARK: -Make Ui-

extension TabBarVC {
    
    private func setControlers() {
        let listListVC = ListVC.init()
        listListVC.tabBarItem = UITabBarItem.init(title: "List", image: "list.dash".getSymbol(), tag: 0)
        
        let favoriteExcercises = FavoriteExcercisesVC.init()
        favoriteExcercises.tabBarItem = UITabBarItem.init(title: "Favorit", image: "star.circle.fill".getSymbol(), tag: 1)
        
        viewControllers = [listListVC, favoriteExcercises]
    }
}
