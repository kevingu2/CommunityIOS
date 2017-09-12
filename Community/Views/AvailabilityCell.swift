//
//  AvailabilityCell.swift
//  Community
//
//  Created by Kevin Gu on 9/10/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit

let NUM_MEALS = 3
let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

class AvailableCell: UICollectionViewCell{

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test"
        return label
    }()
    
    
    func setupViews(){
        addSubview(dayLabel)
        let section = self.frame.width/4
        dayLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        dayLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        dayLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: section * -3).isActive = true
        dayLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dayLabel.layer.borderColor = UIColor.black.cgColor
        dayLabel.layer.borderWidth = 2.0
        // Create clickable Views
        for index in 0...(NUM_MEALS - 2) {
            let clickableView = UIView()
            addSubview(clickableView)
            clickableView.layer.borderColor = UIColor.black.cgColor
            clickableView.layer.borderWidth = 2.0
            clickableView.translatesAutoresizingMaskIntoConstraints = false
            clickableView.backgroundColor = .orange
            clickableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            clickableView.leftAnchor.constraint(equalTo: dayLabel.rightAnchor, constant: section * CGFloat(index)).isActive = true
            clickableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: section * CGFloat(-index)).isActive = true
            clickableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
