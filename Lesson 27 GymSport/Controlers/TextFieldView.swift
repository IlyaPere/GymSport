//
//  TextFieldView.swift
//  Lesson 27 GymSport
//
//  Created by Илья Петров on 14.06.2021.
//

import UIKit

protocol TextFieldViewDelegate {
    func getName(name: String)
}

class TextFieldView: UIView {
    
    var name: String = ""{
        didSet{
            textField.text = name
        }
    }
    
    var myDelegate: TextFieldViewDelegate!
    
    private var viewBackground: UIView!
    
    private let offset: CGFloat = 15
    
    private let heightUi: CGFloat = 40
    
    private var textField: UITextField!
    
    private var buttonCancel: UIButton!
    
    private var buttonOk: UIButton!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .textFieldView
        self.makeView()
        self.makeTextField()
        self.isUserInteractionEnabled = true
        self.makeButtonCancel()
        self.makeButtonOk()
        self.alpha = 0
        self.makeAnimateIn()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        self.makeAnimateOut()
        
    }
    
    private func makeView() {
        let height = offset * 3 + heightUi * 2
        let width = UIScreen.main.bounds.width - offset * 2
        let size = CGSize.init(width: width, height: height)
        let rect = CGRect.init(origin: .zero, size: size)
        viewBackground = UIView.init(frame: rect)
        self.addSubview(viewBackground)
        viewBackground.backgroundColor = .textFieldViewBackground
        viewBackground.frame.origin.x = -viewBackground.frame.size.width
        viewBackground.frame.origin.y = 200
        viewBackground.layer.cornerRadius = 10
        
    }
    
    
    private func makeTextField() {
        
        let size = CGSize.init(width: viewBackground.frame.size.width - offset * 2, height: heightUi)
        let rect = CGRect.init(origin: .zero, size: size)
        textField = UITextField.init(frame: rect)
        viewBackground.addSubview(textField)
        textField.backgroundColor = .orange
        textField.frame.origin.x = offset
        textField.delegate = self
        textField.text = name
        textField.frame.origin.y = offset
        textField.layer.cornerRadius = 10
        textField.placeholder = "Set Name"
        
        
    }
    
    private func makeBaseButton() -> UIButton {
        let size = CGSize.init(width: viewBackground.frame.size.width / 2 - offset * 1.5, height: heightUi)
        let rect = CGRect.init(origin: .zero, size: size)
        let button = UIButton.init(frame: rect)
        viewBackground.addSubview(button)
        button.frame.origin.y = offset * 2 + heightUi
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        return button
        
    }
    
    
    private func makeButtonCancel() {
        buttonCancel = self.makeBaseButton()
        buttonCancel.frame.origin.x = offset
        buttonCancel.setTitle("Cancel", for: .normal)
        buttonCancel.addTarget(self, action: #selector(actionButtonCancel), for: .touchUpInside)
    }                                    
    
    @objc private func actionButtonCancel() {
        self.makeAnimateOut()
    }
    
    
    private func makeButtonOk() {
        buttonOk = self.makeBaseButton()
        buttonOk.frame.origin.x = offset * 2 + buttonCancel.frame.size.width
        buttonOk.setTitle("Ok", for: .normal)
        buttonOk.addTarget(self, action: #selector(actionButtonOk), for: .touchUpInside)
    }
    
    @objc private func actionButtonOk() {
        self.makeAnimateOut() 
    }
    
    deinit {
        print("deinit TextFieldView")
    }
    
}

//MARK: -Anim-

extension TextFieldView {
    
    private func makeAnimateIn() {
        UIView.animate(withDuration: 0.2) {
            self.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: []) {
                self.viewBackground.frame.origin.x = self.offset
            } completion: { _ in
                self.textField.becomeFirstResponder()

            }
        }
    }
    
    private func makeAnimateOut() {
        
        UIView.animate(withDuration: 0.5) {
            self.viewBackground.frame.origin.x = self.frame.size.width
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.alpha = 0
            } completion: { _ in
                self.removeFromSuperview()
            }
        }
    }
}

//MARK:  -TextFieldDelegata-

extension TextFieldView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != "" {
            myDelegate.getName(name: textField.text!)
        }
    }
    
    
}
