//
//  Profile.swift
//  LandmarkPro
//
//  Created by PrinceSmall on 2019/7/16.
//  Copyright © 2019 PrinceSmall. All rights reserved.
//

import SwiftUI
import Foundation

struct Profile {
    var username: String
    var prefresNotifications: Bool
    var seasonalPhoto: Season
    var goalDate: Date
    
    static let `default` = Self(username: "g_kumar",prefresNotifications: true, seasonalPhoto: .winter)
    
    init(username: String, prefresNotifications: Bool = true, seasonalPhoto: Season = .winter) {
        self.username = username
        self.prefresNotifications = prefresNotifications
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = Date()
    }
    
    
    
    
    enum Season: String, CaseIterable {
        case spring = "🌹"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "⛄️"
    }
    
}
