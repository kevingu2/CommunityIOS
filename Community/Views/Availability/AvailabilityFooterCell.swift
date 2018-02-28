//
//  AvailabilityBottomCell.swift
//  Community
//
//  Created by Kevin Gu on 9/18/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit
import CoreData

class AvailableFooterCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    public let contBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    func setupViews() {
        addSubview(contBtn)
        contBtn.setTitle("Continue", for: .normal)
        contBtn.setTitleColor(.blue, for: .normal)
        contBtn.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        contBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
