//
//  DeleteGame.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class DeleteGame {
    
    private weak var localDataSource: GameLocalDataSource?
    
    init(localDataSource: GameLocalDataSource) {
        self.localDataSource = localDataSource
    }
    
    func destroyBy(guid: String) {
        localDataSource?.destroyBy(guid: guid)
    }    
}
