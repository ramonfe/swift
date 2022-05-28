//
//  helpers.swift
//  PMx
//
//  Created by home on 07/04/22.
//

import Foundation
import StoreKit
import UIKit

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

class ReviewHandler  {
    static func requestReview(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive}) as? UIWindowScene{
                SKStoreReviewController.requestReview(in: scene)
            }
        }
    }
}

