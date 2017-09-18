//
//  AvailabilityCell.swift
//  Community
//
//  Created by Kevin Gu on 9/10/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit

let MEALS = ["Breakfast", "Lunch", "Dinner"]


class AvailableView:UIImageView {
    public var availability:Availability?
    
    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class AvailableCell: UICollectionViewCell, UIGestureRecognizerDelegate{
    
    public var availability:Availability!
    {
        didSet {
            self.dayLabel.text = availability.day
            setupViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
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
        dayLabel.layer.borderWidth = 1.0
        
        // Create clickable Views
        for index in 0...(MEALS.count - 1) {
            
            let clickableView = AvailableView(image: nil)
            addSubview(clickableView)
            clickableView.layer.borderColor = UIColor.black.cgColor
            clickableView.layer.borderWidth = 1.0
            clickableView.translatesAutoresizingMaskIntoConstraints = false
            clickableView.backgroundColor = .orange
            clickableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            clickableView.leftAnchor.constraint(equalTo: dayLabel.rightAnchor, constant: section * CGFloat(index)).isActive = true
            clickableView.rightAnchor.constraint(equalTo: dayLabel.rightAnchor, constant: section * CGFloat(index+1)).isActive = true
            clickableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            
            // Add onclick listener
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapMealView(_:)))
            clickableView.availability = availability
            clickableView.tag = index
            clickableView.addGestureRecognizer(tapGesture)
            clickableView.isUserInteractionEnabled = true
        }
    }

    @objc
    func tapMealView(_ sender: UITapGestureRecognizer){
        if let view = sender.view as? AvailableView{
            if let availability = view.availability {
                if view.tag == 0 {
                    availability.breakfast = !availability.breakfast
                } else if view.tag == 1 {
                    availability.lunch = !availability.lunch
                } else if view.tag == 2{
                    availability.dinner = !availability.dinner
                }
                if view.image == nil {
                    let checkMarkImg = UIImage(named: "checkmark")
                    view.image = checkMarkImg
                    view.contentMode = .scaleAspectFit
                } else{
                    view.image = nil
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
