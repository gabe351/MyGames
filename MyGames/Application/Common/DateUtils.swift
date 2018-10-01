//
//  DateUtils.swift
//  MyGames
//
//  Created by Gabriel Rosa on 01/10/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public class DateUtils {
    
    public static func buildDateFrom(formatedDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        if let dateFormated = dateFormatter.date(from: formatedDate) {
            return dateFormated
        }
        
        return Date()
    }
    
    public static func buildFormatedDate(_ date: Date) -> String {
        let dateFormatter       = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        dateFormatter.locale = Locale(identifier: "en_US")
        
        return dateFormatter.string(from: date)
    }
    
    public static func getYearFrom(date: Date) -> Int {
        let calendar     = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let yearFromDate = calendar?.component(NSCalendar.Unit.year, from: date)
        
        guard let year = yearFromDate else {
            return 0
        }
        return year
    }
    
    public static func getReleasedAtFormated(date: Date) -> String {
        let year  = DateUtils.getYearFrom(date: date)
        let older = DateUtils.getYearFrom(date: Date()) - year
        
        if older == 0 { return "From this year" }
        
        return "\(older) years old"
    }
}
