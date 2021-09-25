//
//  ListExercisesVC.swift
//  Lesson 27 GymSport
//
//  Created by Илья Петров on 22.05.2021.
//

import UIKit

class ListExercisesVC: UITableViewController {
    
    var list: List!
    
    
    
}

//MARK: -Live Cycle Controlrts-

extension ListExercisesVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle()
        self.makeButtonAdd()
    }
}

//MARK: -Set Navigation Bar-

extension ListExercisesVC {
    
    private func setTitle() {
        navigationItem.title = list.name
    }
    
    private func makeButtonAdd() {
        let button = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(actionButtonAdd))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc private func actionButtonAdd() {
        
        let exercisesVC = ExercisesVC.init()
        
        exercisesVC.exercise = CoreDataManager.shared.makeExercises(list: list)
        navigationController?.pushViewController(exercisesVC, animated: true)
    }
}




