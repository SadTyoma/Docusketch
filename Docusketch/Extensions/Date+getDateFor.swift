//
//  Date+getDateFor.swift
//  Docusketch
//
//  Created by Artem Shuneyko on 12.07.23.
//

import Foundation

extension Date {
    func getDateFor(days:Int) -> Date? {
         return Calendar.current.date(byAdding: .day, value: days, to: Date())
    }
}
