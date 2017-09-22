	//
//  ViewController.swift
//  Community
//
//  Created by Kevin Gu on 8/26/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit
import CoreData

class AvailabilityController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
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
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(AvailableFooterCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId)
        setupData()
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
            return header
        } else{
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
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
    
}


