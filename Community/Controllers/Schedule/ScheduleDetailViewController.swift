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
    
    let dateView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        return view
    }()
    
    let calendarView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "calendar")
        return imageView
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12/16/2017 (Sat)"
        label.textAlignment = .center
        return label
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
        label.text = "TEST"
        label.textAlignment = .center
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        return label
    }()
    
    let timeView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .blue
        label.text = "TEST"
        return label
    }()
    
    let locationView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .blue
        label.text = "TEST"
        return label
    }()
    
    let typeFoodView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .blue
        label.text = "TEST"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        imageView.image = UIImage(named: userImage)
        view.addSubview(imageView)
        view.addSubview(infoContainer)
        stackView = UIStackView(arrangedSubviews: [titleView, dateView, locationView, typeFoodView])
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
    
    func setupDateView() {
        dateView.addArrangedSubview(calendarView)
        dateView.addArrangedSubview(dateLabel)
        calendarView.leftAnchor.constraint(equalTo: infoContainer.leftAnchor).isActive = true
    }
    
    func setupStackView() {
        setupInfoContainer()
        setupDateView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.topAnchor.constraint(equalTo: infoContainer.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: infoContainer.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: infoContainer.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: infoContainer.rightAnchor).isActive = true
    }
}
