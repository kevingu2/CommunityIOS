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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        let contBtn = UIButton(type: .custom)
        addSubview(contBtn)
        contBtn.setTitle("Continue", for: .normal)
        contBtn.setTitleColor(.blue, for: .normal)
        contBtn.addTarget(self, action: #selector(self.transitionToSearch(_:)), for: .touchUpInside)
        contBtn.translatesAutoresizingMaskIntoConstraints = false
        contBtn.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contBtn.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    }
    
    @objc
    func transitionToSearch(_ sender: UIButton){
        if let delegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = delegate.persistentContainer.viewContext
            do {
                try(context.save())
            } catch{
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
        }
    }
}
