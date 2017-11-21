//
//  Date+DayOfWeek.swift
//  Community
//
//  Created by Kevin Gu on 11/20/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
        // or use capitalized(with: locale) if you want
    }
}
