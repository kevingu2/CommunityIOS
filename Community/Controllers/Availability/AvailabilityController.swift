	//
//  ViewController.swift
//  Community
//
//  Created by Kevin Gu on 8/26/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit
import CoreData

extension Notification.Name {
    public static let frequencyNotfication = Notification.Name(rawValue: "frequencyNotficationKey")
}
    
class AvailabilityController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIPickerViewDelegate, UIPickerViewDataSource {
    public var pickerView:UIPickerView!
    
    let dayCellId = "dayCellId"
    let mealCellId = "mealCellId"
    let headerId = "headerId"
    let footerId = "footerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Click on the days you are free"
        collectionView?.backgroundColor = .white
        collectionView?.delegate   = self
        collectionView?.dataSource = self
        collectionView?.register(AvailableCell.self, forCellWithReuseIdentifier: dayCellId)
        collectionView?.register(MealCell.self, forCellWithReuseIdentifier: mealCellId)
        collectionView?.register(FrequencyCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(AvailableFooterCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId)
        setupData()
        
        // Create PickerView
        let pickerRect = CGRect(x: 0, y: 0, width: view.frame.width, height:300)
        pickerView = UIPickerView(frame: pickerRect)
        self.view.addSubview(pickerView)
        pickerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        pickerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.backgroundColor = .white
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.isHidden = true
        pickerView.isUserInteractionEnabled = true
        pickerView.layer.borderWidth = 2
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count + 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        if indexPath.row == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: mealCellId, for: indexPath)
        }else{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: dayCellId, for: indexPath)
            if let availableCell = cell as? AvailableCell {
                if let delegate = (UIApplication.shared.delegate as? AppDelegate){
                    let context = delegate.persistentContainer.viewContext
                    let predicate = NSPredicate(format: "day=%@", argumentArray: [days[indexPath.row - 1]])
                    let fetchRequest:NSFetchRequest<Availability> = Availability.fetchRequest()
                    fetchRequest.predicate = predicate
                    do {
                        availableCell.availability = try(context.fetch(fetchRequest)[0])
                    } catch{
                        let nserror = error as NSError
                        fatalError("Unresolved error \(nserror)")
                    }
                }
            }
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
            if let frequencyCell = header as? FrequencyCell {
                frequencyCell.pickerView = pickerView
            }
            return header
        } else{
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
            pickerView.topAnchor.constraint(equalTo: footer.bottomAnchor).isActive = true
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height:50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height:50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height:100)
    }
    
    // Mark: Picker View
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row+1)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // do something with the resulting selected row
        
        // reset the picker to the middle of the long list
        pickerView.selectRow(row, inComponent: 0, animated: false)
        let frequencyInfo = ["num" : row + 1]
        NotificationCenter.default.post(name: .frequencyNotfication, object: nil, userInfo: frequencyInfo)
        pickerView.isHidden = true
    }
    
    // columns count
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // rows count
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 7
    }
}


