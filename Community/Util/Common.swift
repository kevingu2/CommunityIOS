//
//  Common.swift
//  Community
//
//  Created by Kevin Gu on 10/30/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit

func filterStrings(strings: [String], keyword: String) -> [String] {
    var filteredStrings: [String] = []
    if keyword == "" {
        return strings
    }
    for string in strings {
        if string.range(of: keyword) != nil {
            filteredStrings.append(string)
        }
    }
    return filteredStrings
}

func addBoldText(fullString: NSString, boldPartOfString: NSString, font: UIFont!, boldFont: UIFont!) -> NSAttributedString {
    let nonBoldFontAttribute = [NSAttributedStringKey.font: font!]
    let boldFontAttribute = [NSAttributedStringKey.font: boldFont!]
    let boldString = NSMutableAttributedString(string: fullString as String, attributes: nonBoldFontAttribute)
    boldString.addAttributes(boldFontAttribute, range: fullString.range(of: boldPartOfString as String))
    return boldString
}
