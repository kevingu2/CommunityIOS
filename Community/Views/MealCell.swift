//
//  MealCell.swift
//  Community
//
//  Created by Kevin Gu on 9/17/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit

class MealCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){
        // Setup Blank cell
        let section = self.frame.width/4
        var cellText = MEALS
        cellText.insert("", at: 0)
        for index in 0...(cellText.count - 1) {
            let mealLabel = UILabel()
            addSubview(mealLabel)
            mealLabel.layer.borderColor = UIColor.black.cgColor
            mealLabel.layer.borderWidth = 1.0
            mealLabel.translatesAutoresizingMaskIntoConstraints = false
            mealLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            mealLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: section * CGFloat(index)).isActive = true
            mealLabel.rightAnchor.constraint(equalTo: self.leftAnchor, constant: section * CGFloat(index+1)).isActive = true
            mealLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            mealLabel.text = cellText[index]
            mealLabel.textAlignment = .center
            mealLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
