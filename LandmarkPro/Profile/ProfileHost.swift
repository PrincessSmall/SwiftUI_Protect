
//
//  ProfileHost.swift
//  LandmarkPro
//
//  Created by PrinceSmall on 2019/7/15.
//  Copyright © 2019 PrinceSmall. All rights reserved.
//

import SwiftUI

struct ProfileHost : View {
    @Environment(\.editMode) var mode
    @State var profile = Profile.default
    @State var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if self.mode?.value == .active {
                    Button(action: {
                        self.profile = self.draftProfile
                        self.mode?.animation().value = .inactive
                    }) {
                        Text("Done")
                    }
                }else{
                    Button(action: {
//                         TODO
                    }) {
                        Text("return")
                    }
                }
                
                Spacer()
                EditButton()
            }
            if self.mode?.value == .inactive {
                ProfileSummer(profile: profile)
            } else {
                ProfileEdit(profile: $draftProfile)
                    .onDisappear {
                        self.draftProfile = self.profile
                }
            }
        }
        .padding()
    }
}

#if DEBUG
struct ProfileHost_Previews : PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
#endif
