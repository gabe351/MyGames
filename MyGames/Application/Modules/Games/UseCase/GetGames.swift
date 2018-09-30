//
//  GetGames.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class GetGames {
    
    private weak var localDataSource: GameLocalDataSource?
    
    init(localDataSource: GameLocalDataSource) {
        self.localDataSource = localDataSource
    }
    
    func all() -> [Game] {
        guard let foundGames = localDataSource?.allGames() else {
            return []
        }
        
        return foundGames
    }
    
    func findBy(guid: String) -> Game {
        guard let foundGame = localDataSource?.findBy(guid: guid) else {
            return GameLocalDataSourceImpl.emptyGame()
        }
        
        return foundGame
    }
}
