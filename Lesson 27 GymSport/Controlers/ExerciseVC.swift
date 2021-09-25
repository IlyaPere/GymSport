//
//  ExercisesVC.swift
//  Lesson 27 GymSport
//
//  Created by Илья Петров on 22.05.2021.
//

import UIKit

class ExerciseVC: UITableViewController {
    
    var exercise: Exercise!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle()
        self.makeButtonBar()
    }

}

//MARK: -Set Navigation Bar-

extension ExerciseVC {
    
    func setTitle() {
        if exercise.name == nil {
            navigationItem.title = "Exercise"
        }else {
            navigationItem.title = exercise.name
        }
        
    }
    
    func makeButtonBar() {
        let buttonSave = UIBarButtonItem.init(barButtonSystemItem: .save, target: self, action: #selector(actionBattonSave))
        let buttonCansel = UIBarButtonItem.init(barButtonSystemItem: .cancel, target: self, action: #selector(actionButtonCansel))
        let buttonEdit = UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(actionButtonEdit))
        navigationItem.leftBarButtonItem = buttonCansel
        navigationItem.rightBarButtonItems = [buttonSave, buttonEdit]
    }
    
    @objc func actionBattonSave() {
        for cell in tableView.visibleCells {
            (cell as! CustomCell).textView.resignFirstResponder()
        }
        CoreDataMeneger.shared.saveContext()
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func actionButtonCansel() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func actionButtonEdit() {
        let textFieldView = TextFieldView.init(frame: UIScreen.main.bounds)
        textFieldView.name = exercise.name!
        textFieldView.myDelegate = self
        self.navigationController?.view.addSubview(textFieldView)
    }

}
//MARK: -UITableViewDataSource-

extension ExerciseVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifaer = String.init(describing: CustomCell.self)
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifaer) as? CustomCell
        if cell == nil {
            cell = CustomCell.init(style: .default, reuseIdentifier: identifaer)
            cell!.textView.delegate = self
        }
        
        cell?.textView.text = exercise.decript

        
        return cell!
    }
    
    
    
}

//MARK: -UITableViewDelegate-

extension ExerciseVC {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CustomCell.height
    }
}

 

extension ExerciseVC: UITextViewDelegate {
    
    func textViewDidEndEditing(_ textView: UITextView) {
        let text = textView.text
        exercise.decript = text
    }
}

//MARK: -TextFieldViewDelegate-

extension ExerciseVC: TextFieldViewDelegate {
    func getName(name: String) {
        exercise.name = name
        navigationItem.title = exercise.name
    }
    
    
    
}


