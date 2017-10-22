//
//  CommunityViewController.swift
//  Community
//
//  Created by Kevin Gu on 10/13/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit

class CommunityViewController: UIViewController {
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Search"
        return textField
    }()
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let plusImageView: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("+", for: .normal)
        return button
    }()
    
    let rightNavigationButton: UIBarButtonItem = {
        let rightNavigationButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        rightNavigationButton.tintColor = .white
        return rightNavigationButton
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        navigationItem.titleView = inputsContainerView
        setupInputContainerView()
        inputsContainerView.addSubview(searchTextField)
        setupSearchTextfield()
        navigationItem.rightBarButtonItem = rightNavigationButton
    }
    
    func setupInputContainerView() {
        inputsContainerView.centerYAnchor.constraint(equalTo: navigationController!.navigationBar.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: navigationController!.navigationBar.widthAnchor, constant:-50).isActive = true
        inputsContainerView.leftAnchor.constraint(equalTo: navigationController!.navigationBar.leftAnchor, constant: -12)
        inputsContainerView.heightAnchor.constraint(equalTo: navigationController!.navigationBar.heightAnchor, constant:-12).isActive = true
    }
    
    func setupSearchTextfield() {
        searchTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        searchTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        searchTextField.bottomAnchor.constraint(equalTo: inputsContainerView.bottomAnchor).isActive = true
        searchTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
    }
    
    func setupRightNavigationItem() {
        navigationItem.rightBarButtonItem?.customView?.leftAnchor.constraint(equalTo: inputsContainerView.rightAnchor).isActive = true
    }
    
    @objc
    func addTapped(_ sender: UIBarButtonItem){
        print(sender.title)
    }
}
