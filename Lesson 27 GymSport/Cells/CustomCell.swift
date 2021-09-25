//
//  CustomCell.swift
//  Lesson 27 GymSport
//
//  Created by Илья Петров on 14.08.2021.
//

import UIKit

class CustomCell: UITableViewCell {
    
    static var height: CGFloat = 200
    
    var lable: UILabel!
    
    var textView: UITextView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeLable()
        makeTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeLable() {
        let size = CGSize.init(width: UIScreen.main.bounds.width, height: 40)
        let rect = CGRect.init(origin: .zero, size: size)
        lable = UILabel.init(frame: rect)
        lable.text = "Description:"
        self.addSubview(lable)
        
        
    }
    
    func makeTextView() {
        let size = CGSize.init(width: UIScreen.main.bounds.width, height: 150)
        let rect = CGRect.init(origin: .zero, size: size)
        textView = UITextView.init(frame: rect)
        self.contentView.addSubview(textView)
        self.textView.backgroundColor = .cyan
        textView.frame.origin.y = 45
        
    }
}
