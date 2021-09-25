//
//  FavoriteExcercisesVC.swift
//  Lesson 27 GymSport
//
//  Created by Илья Петров on 22.05.2021.
//


import UIKit

class FavoriteExcercisesVC: UITableViewController {
   
    
    
}

//MARK: -Live Cycle Controler-

extension FavoriteExcercisesVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backgroundFavorite
            
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setTitle()
        self.setButtosNavBar()
    }
}

//MARK: -Set Navigation Bar-

extension FavoriteExcercisesVC {
    
    private func setTitle() {
        self.tabBarController!.navigationItem.title = "Favorites"
    }
    
    
    private func setButtosNavBar() {
        let button = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(actionButtonAdd))
        tabBarController!.navigationItem.rightBarButtonItem = button
        
    }
    
    @objc func actionButtonAdd() {
        
    }
    
}
