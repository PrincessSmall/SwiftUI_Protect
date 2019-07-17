//
//  ContentView.swift
//  PSTest
//
//  Created by PrinceSmall on 2019/7/3.
//  Copyright © 2019 PrinceSmall. All rights reserved.
//

import SwiftUI


struct LandmarkDetail : View {
    @EnvironmentObject var userData: UserData
    
    var landmark: Landmark
    var landmarkIndex: Int{
        userData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    var body: some View {
        VStack{
//            地图
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
//            图片
            CircleImage(image: landmark.image(forSize: 250))
                .offset(y: -130)
            .padding(.bottom, -130)
//            描述
            VStack(alignment: .leading) {
                HStack{
                    Text(landmark.name).font(.title)
                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }) {
                        if self.userData.landmarks[self.landmarkIndex].isFavorite{
                            Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        }else{
                            Image(systemName: "star")
                                .foregroundColor(.yellow)
                        }
                    }
                }
                HStack{
                    Text(landmark.park).font(.subheadline)
                    Spacer()
                    Text(landmark.state).font(.subheadline)
                }
            }
            .padding()
//            ExtractedListView()
//            垫片，把视图推到顶部
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
        .environmentObject(UserData())
    }
}
#endif

/// VStack
struct ExtractedView : View {
    let nameArray = ["Tong","Li"]
    var body: some View {
        return Text(nameArray[0]).font(.title).color(.red)
    }
}

/// HStack
struct ExtractedHStackView : View {
    let name = "tongle"
    var body: some View {
        return HStack(alignment: .center, spacing: 11) {
            Text("Name:").font(.title).fontWeight(.bold).color(.green)
            Text(name).font(.subheadline)
        }
    }
}

/// List
struct ExtractedListView : View {
    var body: some View {
        return List (0 ..< 4){item in
            Image("icon")
            VStack(alignment: .leading, spacing: 10){
                if item == 1{
                    Text("Tongle").font(.title)
                    Text("Beautiful").font(.subheadline)
                }else{
                    Text("Placeholder").font(.title)
                    Text("Beautiful").font(.subheadline)
                }
            }
            
        }
        .frame(height:420.0)
}
}
