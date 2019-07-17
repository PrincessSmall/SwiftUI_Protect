
//
//  ProfileEdit.swift
//  LandmarkPro
//
//  Created by PrinceSmall on 2019/7/16.
//  Copyright © 2019 PrinceSmall. All rights reserved.
//

import SwiftUI

struct ProfileEdit : View {
    @Binding var profile: Profile
    
    var body: some View {
        List{
            HStack{
                Text("username").bold()
                Divider()
                TextField("username",text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefresNotifications) {
                Text("Enable Notifications")
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                
                SegmentedControl(selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases.identified(by: \.self)) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
            }
            .padding(.top)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Goal Date").bold()
                DatePicker(
                    $profile.goalDate,
                    minimumDate: Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate),
                    maximumDate: Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate),
                    displayedComponents: .date
                )
            }
            .padding(.top)
        }
    }
}

#if DEBUG
struct ProfileEdit_Previews : PreviewProvider {
    static var previews: some View {
        ProfileEdit(profile: .constant(.default))
    }
}
#endif
