
//
//  UserData.swift
//  PSTest
//
//  Created by PrinceSmall on 2019/7/4.
//  Copyright © 2019 PrinceSmall. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: BindableObject{
    let didChange = PassthroughSubject<UserData, Never>()
    var showFavoriteOnly = false{
        didSet{
            didChange.send(self)
        }
    }
    var landmarks = landmarkData{
        didSet{
            didChange.send(self)
        }
    }
}
