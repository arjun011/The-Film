//
//  Helper.swift
//  The Film
//
//  Created by Arjun on 12/01/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import Foundation
class Helper {
    
    static func convertDateFormat(inputDate: String) -> String {
        
        let olDateFormatter = DateFormatter()
        olDateFormatter.dateFormat = "yyyy-MM-dd"

        let oldDate = olDateFormatter.date(from: inputDate)

        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = "MMM dd, yyyy"

        return convertDateFormatter.string(from: oldDate ?? Date())
   }
    
}
