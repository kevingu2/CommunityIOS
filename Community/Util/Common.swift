//
//  Common.swift
//  Community
//
//  Created by Kevin Gu on 10/30/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

func filterStrings(strings: [String], keyword: String) -> [String] {
    var filteredStrings:[String] = []
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
