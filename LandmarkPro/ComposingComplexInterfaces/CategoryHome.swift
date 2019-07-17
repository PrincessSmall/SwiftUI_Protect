
//
//  CategoryHome.swift
//  LandmarkPro
//
//  Created by PrinceSmall on 2019/7/5.
//  Copyright © 2019 PrinceSmall. All rights reserved.
//

import SwiftUI

struct CategoryHome : View {
    var categories: [String: [Landmark]]{
        .init(
            grouping: landmarkData,
            by: { $0.category.rawValue}
        )
    }
    var featured: [Landmark]{
        landmarkData.filter{ $0.isFavorite}
    }
    
    
    var body: some View {
        NavigationView{
            List{
                
                FeatureCard(landmark: features[0])
                
                ForEach(categories.keys.sorted().identified(by: \.self)){key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                } 
                .listRowInsets(EdgeInsets())
                NavigationLink(destination: LandmarkList()){
                    Text("see all")
                }
            }
            .navigationBarTitle(Text("Featured"))
                .navigationBarItems(trailing:
                    PresentationLink(destination: ProfileHost()) {
                        Image(systemName: "person.crop.circle")
                            .imageScale(.large)
                            .accessibility(label: Text("User Profile"))
                            .padding()
                    }
                    
            )
            
        }
    }
}

#if DEBUG
struct CategoryHome_Previews : PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
#endif
