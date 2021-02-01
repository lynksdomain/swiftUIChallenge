//
//  ViewExtensions.swift
//  Challenge
//
//  Created by Lynk on 1/31/21.
//

import SwiftUI


extension Date {
    func formattedDate() -> String {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: self)
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .ordinal
        let formattedDay = numberFormat.string(from: NSNumber(value: day))
        let monthFormat = DateFormatter()
        monthFormat.dateFormat = "MMM"
        let month = monthFormat.string(from: self)
        let timeFormat = DateFormatter()
        timeFormat.dateFormat = "h:mm a"
        let time = timeFormat.string(from: self)
        guard let formatDay = formattedDay else { return "" }
        return "\(month) \(formatDay), \(time)"
    }
}



extension UIColor {

     class func color(data:Data) -> UIColor? {
          return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor
     }

     func encode() -> Data? {
          return try? NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
     }
}
