//
//  CircleImage.swift
//  PSTest
//
//  Created by PrinceSmall on 2019/7/3.
//  Copyright © 2019 PrinceSmall. All rights reserved.
//

import SwiftUI

struct CircleImage : View {
    var  image: Image
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle()
                .stroke(Color.red,lineWidth: 4))
            .shadow(color: .red, radius: 10, x: 0, y: 0)
        
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("icon"))
    }
}
#endif
