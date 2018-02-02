//
//  DateHelpers.swift
//  Task_v2
//
//  Created by Taylor Bills on 2/1/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import Foundation

extension Date {
    
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
}
