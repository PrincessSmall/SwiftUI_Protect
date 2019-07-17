
//
//  ProfileSummer.swift
//  LandmarkPro
//
//  Created by PrinceSmall on 2019/7/16.
//  Copyright © 2019 PrinceSmall. All rights reserved.
//

import SwiftUI

struct ProfileSummer : View {
    var profile: Profile
    
    static let goalFormat: DateFormatter = {
        let dateformerter = DateFormatter()
        dateformerter.dateFormat = "yyyy-MM-dd"
        return dateformerter
    }()
    var body: some View {
        List{
            Text(profile.username)
                .color(.red)
                .bold()
                .font(.title)
            
            Text("Notifications: \(self.profile.prefresNotifications ? "On": "Off" )")
            
            Text("Seasonal Photos: \(self.profile.seasonalPhoto.rawValue)")
            
            Text("Goal Date: \(self.profile.goalDate, formatter: Self.goalFormat)")
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Completed Badges")
                .font(.headline)
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(alignment: .top, spacing: 10){
                        HikeBadge(name: "First Hike")
                        HikeBadge(name: "Earth Day")
                        .hueRotation(Angle(degrees: 90))
                        HikeBadge(name: "Tenth Hike")
                        .hueRotation(Angle(degrees: 45))
                        HikeBadge(name: "Last Hike")
                        .hueRotation(Angle(degrees: 180))
                    }
                }
            }
        }
        
    }
}

#if DEBUG
struct ProfileSummer_Previews : PreviewProvider {
    static var previews: some View {
        ProfileSummer(profile: Profile.default)
    }
}
#endif
