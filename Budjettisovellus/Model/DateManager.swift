//
//  DateManager.swift
//  Budjettisovellus
//
//  Created by Veikko Arvonen on 5.11.2025.
//

import Foundation

struct DateManager {
    
    func getDateHeader(for date: Date) -> String {
        let dateComponents = Calendar.current.dateComponents([.year, .month], from: date)
        let yearComps = dateComponents.year ?? 2025
        let monthComps = dateComponents.month ?? 1
        
        var monthString = "Tammikuu"
        
        switch monthComps {
        case 1:  monthString = "Tammikuu"
        case 2:  monthString = "Helmikuu"
        case 3:  monthString = "Maaliskuu"
        case 4:  monthString = "Huhtikuu"
        case 5:  monthString = "Toukokuu"
        case 6:  monthString = "Kesäkuu"
        case 7:  monthString = "Heinäkuu"
        case 8:  monthString = "Elokuu"
        case 9:  monthString = "Syyskuu"
        case 10: monthString = "Lokakuu"
        case 11: monthString = "Marraskuu"
        case 12: monthString = "Joulukuu"
        default: monthString = "Tuntematon"
        }
        
        let dateHeader = "\(monthString) \(yearComps)"
        
        return dateHeader

    }
    
}
