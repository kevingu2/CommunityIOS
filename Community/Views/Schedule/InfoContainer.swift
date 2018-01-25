//
//  InfoContainer.swift
//  Community
//
//  Created by Kevin Gu on 1/25/18.
//  Copyright © 2018 kgulabs. All rights reserved.
//

import UIKit

class InfoContainer: UIView {
    
    public var iconName: String!
    {
        didSet {
            self.iconView.image = UIImage(named: iconName)
            setupView()
        }
    }
    
    public var detail: String!
    {
        didSet {
            self.detailLabel.text = detail
            setupView()
        }
    }
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        let stackView = UIStackView(arrangedSubviews: [iconView, detailLabel])
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 24
        stackView.distribution = .fillProportionally
        stackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        setupIconView()
    }
    
    func setupIconView() {
        iconView.widthAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        iconView.heightAnchor.constraint(lessThanOrEqualToConstant: 40).isActive = true
    }
}
