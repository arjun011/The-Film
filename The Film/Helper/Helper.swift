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
   
    static func convertTimeTohourMinute(input: Int) -> String {
        let time = self.getFormattedVideoTime(Duration: input)
        return ("\(time.hour)h \(time.minute)m")
    }
    
    static private func getFormattedVideoTime(Duration: Int) -> (hour: Int, minute: Int, seconds: Int){
        let totalVideoDuration = Duration * 60
        let seconds = totalVideoDuration % 60
        let minutes = (totalVideoDuration / 60) % 60
        let hours   = Int(totalVideoDuration / 3600)
        return (hours,minutes,seconds)
    }
}
