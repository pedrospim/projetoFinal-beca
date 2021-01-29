//
//  DateFormat.swift
//  Commons
//
//  Created by Lucas Abdel Leitao on 28/01/21.
//

import Foundation


public let data = Date().getFormattedDate(format: "dd MMM yyyy") // Set output format

public extension Date {
   public func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
