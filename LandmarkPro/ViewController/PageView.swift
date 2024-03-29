
//
//  PageView.swift
//  LandmarkPro
//
//  Created by PrinceSmall on 2019/7/16.
//  Copyright © 2019 PrinceSmall. All rights reserved.
//

import SwiftUI

struct PageView <Page:View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0
    
    init(_ views: [Page]) {
        self.viewControllers = views.map{
            UIHostingController(rootView: $0)
        }
    }
    
    var body: some View {
        VStack{
           PageViewController(controllers: viewControllers,currentPage: $currentPage)
            Text("currentPage:\(currentPage)")
        }
    }
}

#if DEBUG
struct PageView_Previews : PreviewProvider {
    static var previews: some View {
        PageView(features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3/2, contentMode: .fit)
    }
}
#endif
