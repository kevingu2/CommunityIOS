//
//  ScheduleDetailViewController.swift
//  Community
//
//  Created by Kevin Gu on 11/21/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit

class ScheduleDetailViewController: UIViewController {
    
    var userImage = "ProfileImage"
    var stackView: UIStackView!
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let infoContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.0
        return view
    }()
    
    let titleView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "DishDash"
        label.textAlignment = .center
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let timeView: InfoContainer = {
        let view = InfoContainer()
        view.iconName =  "calendar"
        view.detail = "11:30 AM - 12:30 PM"
        return view
    }()
    
    let locationView:InfoContainer = {
        let view = InfoContainer()
        view.iconName =  "calendar"
        view.detail = "190 S Murphy Ave, Sunnyvale, CA 94086"
        return view
    }()
    
    let typeFoodView: InfoContainer = {
        let view = InfoContainer()
        view.iconName =  "calendar"
        view.detail = "Middle Eastern, Mediterranean"
        return view
    }()
    
    let dateView: InfoContainer = {
        let dateView = InfoContainer()
        dateView.iconName =  "calendar"
        dateView.detail = "12/16/2017 (Sat)"
        return dateView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        imageView.image = UIImage(named: userImage)
        view.addSubview(imageView)
        view.addSubview(infoContainer)
        stackView = UIStackView(arrangedSubviews: [titleView, dateView, timeView, locationView, typeFoodView])
        infoContainer.addSubview(stackView)
        setupProfileImageView()
        setupStackView()
    }
    
    func setupInfoContainer() {
        let guide = view.safeAreaLayoutGuide
        infoContainer.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 12).isActive = true
        infoContainer.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        infoContainer.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -12).isActive = true
        infoContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupProfileImageView() {
        let guide = view.safeAreaLayoutGuide
        imageView.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1.0).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    
    func setupStackView() {
        setupInfoContainer()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.topAnchor.constraint(equalTo: infoContainer.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: infoContainer.bottomAnchor, constant: -24).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -48).isActive = true
    }
}
