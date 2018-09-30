//
//  InjectionUseCase.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class InjectionUseCase {
    
    static let gameLocalDataSource = InjectionLocalDataSource
        .provideGameLocalDataSource()
    
    static let consolelocalDataSource = InjectionLocalDataSource
        .provideConsoleLocalDataSource()
    
    static func provideGetGames() -> GetGames {
        return GetGames(localDataSource: gameLocalDataSource)
    }
    
    static func provideGetConsoles() -> GetConsoles {
        return GetConsoles(localDataSource: consolelocalDataSource)
    }
    
    static func provideSaveGame() -> SaveGame {
        return SaveGame(localDataSource: gameLocalDataSource)
    }
    
    static func provideSaveConsole() -> SaveConsole {
        return SaveConsole(localDataSource: consolelocalDataSource)
    }
    
    static func provideDeleteGame() -> DeleteGame {
        return DeleteGame(localDataSource: gameLocalDataSource)
    }
    
    static func provideDeleteConsole() -> DeleteConsole {
        return DeleteConsole(localDataSource: consolelocalDataSource)
    }
}
