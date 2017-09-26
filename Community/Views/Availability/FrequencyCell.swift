//
//  FrequencyCell.swift
//  Community
//
//  Created by Kevin Gu on 9/21/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit

class FrequencyCell: UICollectionViewCell{
    
    public var pickerView:UIPickerView!
    var textView: UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateTextView(_:)), name: .frequencyNotfication, object: nil)
    }
    
    func setupViews() {
        let rect = CGRect(
            x: 0,
            y: 0,
            width: self.frame.width/2,
            height: self.frame.height/2
            
        )
        textView = UITextView(frame: rect)
        addSubview(textView)
        textView.textAlignment = .left
        textView.textColor = .lightGray
        textView.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        textView.text = "# of meetup in a week"
        textView.topAnchor.constraint(equalTo: self.topAnchor, constant:10).isActive = true
        textView.leftAnchor.constraint(equalTo: self.leftAnchor,constant:10).isActive = true
        textView.rightAnchor.constraint(equalTo: self.rightAnchor, constant:-(self.frame.width/3)).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant:-10).isActive = true
        textView.isEditable = false
        textView.layer.borderWidth = 2
        textView.translatesAutoresizingMaskIntoConstraints = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.showDropDown(_:)))
        textView.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func updateTextView(_ notification: Notification){
        guard let frequency = notification.userInfo?["num"] as? Int else { return }
        textView.text = "\(frequency) times a week"
        textView.textAlignment = .center
        textView.textColor = .black
    }
    
    @objc
    func showDropDown(_ sender: UIButton){
        pickerView.isHidden = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
