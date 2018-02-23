//
//  File.swift
//  Community
//
//  Created by Kevin Gu on 10/13/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit

class ScheduleViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let scheduleId = "scheduleId"
    let dateId = "dataId"
    var schedules: [Any]!
    
    let noScheduleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No scheduled Meetups"
        label.textAlignment = .center
        label.textColor = UIColor.lightGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up collection View
        collectionView?.delegate   = self
        collectionView?.dataSource = self
        collectionView?.register(SchedueInfoCell.self, forCellWithReuseIdentifier: scheduleId)
        collectionView?.register(DateCell.self, forCellWithReuseIdentifier: dateId)
        collectionView?.backgroundColor = .white
        MeetupInfoManager.clearData()
        MeetupInfoManager.load()
        schedules = MeetupInfoManager.getDateWithMeetupInfo()
    }
    
    // MARK: CollectionView
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return schedules.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let schedule = schedules[indexPath.row] as? Schedule {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dateId, for: indexPath) as? DateCell {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM-dd-yyyy"
                let scheduleDay = schedule.date
                let day:String = scheduleDay!.dayOfWeek()!
                let dateString = dateFormatter.string(from: scheduleDay!)
                cell.date = "\(dateString) (\(day))"
                return cell
            }
        } else if let meetupInfo = schedules[indexPath.row] as? MeetupInfo{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: scheduleId, for: indexPath) as? SchedueInfoCell{
                cell.backgroundColor = kRowColors[indexPath.row % 2]
                var hour = 12
                if meetupInfo.time != 12 {
                    hour = Int(meetupInfo.time % 12)
                }
                var period = ""
                if meetupInfo.time/12 < 1 {
                    period = "AM"
                } else {
                    period = "PM"
                }
                cell.time = "\(hour):00 \(period)"
                let restarauntName: String = meetupInfo.restarauntName!
                let userFirstName: String = meetupInfo.user!.firstName!
                var mealPeriod = ""
                if hour >= 18 {
                    mealPeriod = "Dinner"
                } else if hour >= 12 {
                    mealPeriod = "Lunch"
                } else if hour >= 6 {
                    mealPeriod = "Breakfast"
                }
                cell.info = "\(mealPeriod) with \(userFirstName) at \(restarauntName)"
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let _ = schedules[indexPath.row] as? Schedule {
            return CGSize(width: view.frame.width, height:25)
        } else{
            return CGSize(width: view.frame.width, height:50)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 12)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = ScheduleDetailViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
