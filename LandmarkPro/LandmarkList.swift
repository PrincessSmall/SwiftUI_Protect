

//
//  LandmarkList.swift
//  PSTest
//
//  Created by PrinceSmall on 2019/7/4.
//  Copyright © 2019 PrinceSmall. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $userData.showFavoriteOnly) {
                    Text("FavoriteOnly")
                }
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoriteOnly || landmark.isFavorite {
                        NavigationLink(
                            destination: LandmarkDetail(landmark: landmark)
                                .environmentObject(self.userData)
                        ) {
                            LandmarkRow(landmark: landmark)
                        }
                }
            }.navigationBarTitle(Text("Landmarks"))
        }
      }
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView{
            LandmarkList()
            .environmentObject(UserData())
        }
    }
}
#endif
