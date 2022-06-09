//
//  helpers.swift
//  PMx
//
//  Created by home on 07/04/22.
//

import Foundation
import StoreKit
import Defaults

var countShowInterstitial = 0

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

 func didPerformSignificantEvent(){
     Defaults[.ratingEventsCount] += 1
     countShowInterstitial += 1
}

extension Defaults.Keys{
    static let ratingEventsCount = Key<Int>("ratingEventsCount", default: 0)
    static let appSessionsCount = Key<Int>("appSessionsCount", default: 0)
    static let firstOpenDate = Key<Date?>("firstOpenDate")
}

func askForRatingIfNeeded() {
    guard shouldAskForRating else { return }
    askForRating()
}

var shouldAskForRating: Bool {
    let daysUntilPromt = 3
    let sesionsUntilPromt = 4
    let eventsUntilPromt = 5
#if DEBUG
    return true
#endif
    guard let firstLaunchDate = Defaults[.firstOpenDate] else { return false }
    let timeSinceFirstLaunch = Date().timeIntervalSince(firstLaunchDate)
    let timeUntilRate: TimeInterval = 60 * 60 * 24 * TimeInterval(daysUntilPromt)

    print("App Sesions Count \(Defaults[.appSessionsCount])")
    print("Rating Event Count \(Defaults[.ratingEventsCount])")
    print("First OpenDate \(firstLaunchDate)")
    
    return Defaults[.appSessionsCount] >= sesionsUntilPromt
        && Defaults[.ratingEventsCount] >= eventsUntilPromt
        && timeSinceFirstLaunch >= timeUntilRate
}

func askForRating() {
    //reinicia variables para que no haga lag al intentar el requestview
    Defaults[.appSessionsCount] = 0
    Defaults[.ratingEventsCount] = 0
    Defaults[.firstOpenDate] = Date()
    
    #if os(macOS)
        SKStoreReviewController.requestReview()
    #else
        guard let scene = UIApplication.shared.foregroundActiveScene else { return }
        SKStoreReviewController.requestReview(in: scene)
    #endif
}
//MARK: - Target Scene for Presenting request review
extension UIApplication{
    var foregroundActiveScene: UIWindowScene?{
        connectedScenes
            .first(where: {$0.activationState == .foregroundActive}) as? UIWindowScene
    }
}
