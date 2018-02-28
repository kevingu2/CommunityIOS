//
//  AddCommunityViewController.swift
//  Community
//
//  Created by Kevin Gu on 10/30/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit

class CreateCommunityViewController: UIViewController {

    var addNavigationButton: UIBarButtonItem!
    let kUserId = 1

    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.layer.borderWidth = 0
        return view
    }()

    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Name your community ..."
        return textField
    }()

    let nameSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Description"
        return textField
    }()

    let descriptionSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Create a Community"
        view.addSubview(inputsContainerView)
        setupInputContainerView()
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeparatorView)
        setupNameTextField()
        inputsContainerView.addSubview(descriptionTextField)
        inputsContainerView.addSubview(descriptionSeparatorView)
        setupDescriptionTextField()
        navigationController?.navigationBar.tintColor = .white
        addNavigationButton = UIBarButtonItem(title: "Create", style: .done, target: self, action: #selector(self.addTapped(_:)))
        addNavigationButton.tintColor = .white
        navigationItem.rightBarButtonItem = addNavigationButton
    }

    func setupInputContainerView() {
        // Setup input view constraints
        let guide = view.safeAreaLayoutGuide
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1.0).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: view.frame.height/4).isActive = true
    }

    func setupNameTextField() {
        let margins = view.layoutMarginsGuide
        nameTextField.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/4).isActive = true

        nameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    func setupDescriptionTextField() {
        let margins = view.layoutMarginsGuide
        descriptionTextField.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        descriptionTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        descriptionTextField.topAnchor.constraint(equalTo: nameSeparatorView.bottomAnchor).isActive = true
        descriptionTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/4).isActive = true

        descriptionSeparatorView.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor).isActive = true
        descriptionSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        descriptionSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        descriptionSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    // MARK: Button Delegates

    @objc
    func addTapped(_ sender: UIBarButtonItem) {
        CommunityManager.createCommunity(name: nameTextField.text!, details: descriptionTextField.text!, owner: Int64(kUserId))
        self.navigationController?.popViewController(animated: true)
    }
}
