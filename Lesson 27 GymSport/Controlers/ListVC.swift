//
//  ListListVC.swift
//  Lesson 27 GymSport
//
//  Created by Илья Петров on 22.05.2021.
//

import UIKit

class ListVC: UITableViewController {
    
    var exercises = [Exercise]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.backgroundListList
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setTitle()
        self.makeButtonBarAdd()
        
        exercises = CoreDataMeneger.shared.getExersies()
        tableView.reloadData()
    }
}

//MARK: -Set Navigation Bar-

extension ListVC {
    
    
    
    private func setTitle() {
        self.tabBarController!.navigationItem.title = "List exercises"
    }
    
    private func makeButtonBarAdd() {
        let buttonAdd = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(actionAddNewExercise))
            tabBarController!.navigationItem.rightBarButtonItem = buttonAdd
    }
    
    @objc private func actionAddNewExercise() {
        let textFieldView = TextFieldView.init(frame: UIScreen.main.bounds)
        textFieldView.myDelegate = self
        self.navigationController?.view.addSubview(textFieldView)
    }
}


//MARK: -UITableViewDelegate-

extension ListVC {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exercise = exercises[indexPath.row]
        let exerciseVC = ExerciseVC.init()
        exerciseVC.exercise = exercise
        self.tabBarController?.navigationController?.pushViewController(exerciseVC, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let title = "Execise Deleton !!!"
        let message = "You are about to delete this car and all the data associated with it.\nThis operation cannot be reversed.\nProceed?"
        
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        let buttonCancel = UIAlertAction.init(title: "No", style: .cancel, handler: nil)
        let buttonYes = UIAlertAction.init(title: "Yes", style: .destructive) { (_) in
            self.deleteExcisase(indexPath: indexPath)
        }
        alert.addAction(buttonCancel)
        alert.addAction(buttonYes)
        present(alert, animated: true )
    }
    
    
    private func deleteExcisase(indexPath: IndexPath) {
        
        let context = CoreDataMeneger.shared.persistentContainer.viewContext
        let exercise = exercises.remove(at: indexPath.row)
        context.delete(exercise)
        tableView.deleteRows(at: [indexPath], with: .left)
        CoreDataMeneger.shared.saveContext()
    }
}


//MARK: -UITableViewDataSource-

extension ListVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        let exercise = exercises[indexPath.row]
        
        cell?.textLabel?.text = exercise.name
        
        
        
        return cell!
    }
    
    
}


//MARK: -TextFieldViewDelegate-

extension ListVC: TextFieldViewDelegate {
    func getName(name: String) {
        let exersiesVC = ExerciseVC.init()
        let newExersies = CoreDataMeneger.shared.makeExercise(name: name)
        exersiesVC.exercise = newExersies
        
        tabBarController?.navigationController?.pushViewController(exersiesVC, animated: true)
    }

}





