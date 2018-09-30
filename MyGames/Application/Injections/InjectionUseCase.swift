//
//  InjectionUseCase.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class InjectionUseCase {
    
    static func provideGetGames() -> GetGames {
        let localDataSource = InjectionLocalDataSource
            .provideGameLocalDataSource()
        
        return GetGames(localDataSource: localDataSource)
    }    
}
