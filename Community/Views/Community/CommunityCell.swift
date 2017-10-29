//
//  CommunityCell.swift
//  Community
//
//  Created by Kevin Gu on 10/28/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit

class CommunityCell: UICollectionViewCell {
    public var name: String!
    {
        didSet {
            self.nameLabel.text = name
            setupViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        return label
    }()
    
    let container: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "forward_arrow")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func setupViews() {
        container.addSubview(nameLabel)
        container.addSubview(arrowImageView)
        addSubview(container)
        setUpContainer()
        setupNameLabel()
        setupArrowImageView()
    }
    
    func setUpContainer() {
        container.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        container.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        container.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setupArrowImageView() {
        arrowImageView.leftAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        arrowImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        arrowImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        arrowImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setupNameLabel() {
        nameLabel.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 12).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: arrowImageView.leftAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
    }
}
