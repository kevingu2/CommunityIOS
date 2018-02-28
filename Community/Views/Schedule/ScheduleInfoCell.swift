//
//  ScheduleInfoCell.swift
//  Community
//
//  Created by Kevin Gu on 11/11/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit

class SchedueInfoCell: UICollectionViewCell {

    public var time: String! {
        didSet {
            self.timeLabel.text = time
            setupStackView()
        }
    }

    public var info: String! {
        didSet {
            self.infoLabel.text = info
            setupStackView()
        }
    }

    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "6:00 PM"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
        return label
    }()

    let infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Dinner with Kevin at Door Dash"
        label.font = UIFont(name: "HelveticaNeue", size: 14.0)
        return label
    }()

    let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "forward_arrow")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [timeLabel, infoLabel, arrowImageView])
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -12).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
