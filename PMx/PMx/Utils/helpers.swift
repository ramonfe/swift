//
//  helpers.swift
//  PMx
//
//  Created by home on 07/04/22.
//

import Foundation

extension URL {
    init(staticString string: StaticString) {
        guard let url = URL(string: "\(string)") else {
            preconditionFailure("Invalid static URL string: \(string)")
        }

        self = url
    }
}

func unixTime(fechaUnix: String? ) -> String{
    var localDate = "-"
    if let doubleDate = Double(fechaUnix!){
        let date = Date(timeIntervalSince1970: doubleDate)
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = DateFormatter.Style.medium
        dateFormater.timeZone = .current
        localDate = dateFormater.string(from: date)
    }
    return localDate
}

