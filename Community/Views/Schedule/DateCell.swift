//
//  DateCell.swift
//  Community
//
//  Created by Kevin Gu on 11/12/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit

class DateCell: UICollectionViewCell {

    public var date: String! {
        didSet {
            self.dateLabel.text = date
            setupView()
        }
    }

    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = ""
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16.0)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        addSubview(dateLabel)
        dateLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
}
