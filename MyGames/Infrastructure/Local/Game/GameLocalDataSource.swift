//
//  GameLocalDataSource.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public protocol GameLocalDataSource: class {
    
    func allGames() -> [Game]
    func findBy(guid: String) -> Game
    func save(game: Game)
    func destroyBy(guid: String)

    func haveInitialGames() -> Bool
}
