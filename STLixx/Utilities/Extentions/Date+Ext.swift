//
//  Date+Ext.swift
//  STLixx
//
//  Created by Nicolas Neznik on 15/05/2022.
//

import Foundation



extension Date {
    
    var getString: String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "YY/MM/dd"
        return dateFormatter.string(from: self)
        
    }
    
    var timeString: String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        let minutes = calendar.component(.minute, from: self)
        return String(hour)+":"+String(minutes)
    }
    
    var dayInWeek: String{
        let index = Calendar.current.component(.weekday, from: Date()) // this returns an Int
       return Calendar.current.weekdaySymbols[index - 1] // subtract 1 since the index starts at 1
    }
}
