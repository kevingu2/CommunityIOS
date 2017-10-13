//
//  LoginViewController.swift
//  disclosure
//
//  Created by Billy Liang on 9/27/17.
//  Copyright © 2017 Hack. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Sign in", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        return button
    }()

    let usernameTextfield: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Account"
        let defaults = UserDefaults.standard
        let user_name = defaults.string(forKey: "MyUserName")
        if let name = user_name {
            textField.text = name
        } 
        return textField
    }()
    
    let usernameSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, b: 220, g: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextfield: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let passwordSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, b: 220, g: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let appleConnectLabel: UILabel = {
        let label = UILabel()
        label.text = "Apple Connect Login"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "disclosure_eye")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.0)
        view.addSubview(inputsContainerView)
        view.addSubview(loginButton)
        view.addSubview(appleConnectLabel)
        view.addSubview(profileImageView)
        inputsContainerView.addSubview(usernameTextfield)
        inputsContainerView.addSubview(usernameSeparatorView)
        inputsContainerView.addSubview(passwordSeparatorView)
        inputsContainerView.addSubview(passwordTextfield)
        setupInputContainerView()
        setupLoginButton()
        loginButton.addTarget(self, action: #selector(self.login(_:)), for: .touchUpInside)
        setupAppleConnectLabel()
        setupProfileImageView()
        usernameTextfield.delegate = self
        passwordTextfield.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        view.addGestureRecognizer(tap)
    }
    
    func setupProfileImageView() {
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: appleConnectLabel.topAnchor, constant: -12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupAppleConnectLabel() {
        appleConnectLabel.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        appleConnectLabel.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        appleConnectLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:1/2).isActive = true
        appleConnectLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupLoginButton() {
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant:-24).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupInputContainerView() {
        // Setup input view constraints
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant:-24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        usernameTextfield.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        usernameTextfield.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        usernameTextfield.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        usernameTextfield.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2).isActive = true
        usernameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        usernameSeparatorView.topAnchor.constraint(equalTo: usernameTextfield.bottomAnchor).isActive = true
        usernameSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        usernameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        passwordTextfield.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextfield.topAnchor.constraint(equalTo: usernameSeparatorView.topAnchor).isActive = true
        passwordTextfield.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordTextfield.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2).isActive = true
        passwordSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        passwordSeparatorView.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor).isActive = true
        passwordSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    @objc
    func login(_ sender: UIButton){
        let defaults = UserDefaults.standard
        defaults.setValue(self.usernameTextfield.text?.lowercased(), forKey: "MyUserName")

        present(CustomedTabBarController(), animated: true, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let defaults = UserDefaults.standard
        defaults.setValue(self.usernameTextfield.text?.lowercased(), forKey: "MyUserName")
        present(CustomedTabBarController(), animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @objc
    func dismissKeyboard(_ sender: UIButton) {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIColor {
    convenience init(r: CGFloat, b: CGFloat, g: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
