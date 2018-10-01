//
//  MyGamesApplication.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class MyGamesAppliation {
    
    static let saveGame =
        SaveGame(localDataSource: InjectionLocalDataSource
            .provideGameLocalDataSource())
    
    static let saveConsole =
        SaveConsole(localDataSource: InjectionLocalDataSource
            .provideConsoleLocalDataSource())
    
    static func saveInitialGames() {
        
        let older = DateUtils.buildDateFrom(formatedDate: "11/10/1994")
        
        let initalGames = [
            Game(guid: "first-fake-game-guid",
                 title: "God of war",
                 yearDate: older,
                 console: "PS4",
                 completed: false,
                 dateOfCompletion: Date(),
                 personalNotes: "That is a good game",
                 releasedAt: ""),
            Game(guid: "second-fake-game-guid",
                 title: "The Witcher 3",
                 yearDate: Date(),
                 console: "XboxOne",
                 completed: true,
                 dateOfCompletion: Date(),
                 personalNotes: "That is a good game",
                 releasedAt: ""),
            Game(guid: "third-fake-game-guid",
                 title: "Last of Us",
                 yearDate: Date(),
                 console: "Nintendo",
                 completed: true,
                 dateOfCompletion: Date(),
                 personalNotes: "That is a good game",
                 releasedAt: "")
        ]
        
        initalGames.forEach {
            saveGame.save(game: $0)
        }        
    }
    
    static func saveInitialConsoles() {
        let initialConsoles = [
            Console(guid: "first-fake-console-guid",
                    title: "PS4",
                    manufacturer: "Sony"),
            Console(guid: "second-fake-console-guid",
                    title: "XboxOne",
                    manufacturer: "Microsoft"),
            Console(guid: "third-fake-console-guid",
                    title: "Nintendo DS",
                    manufacturer: "Nintendo")
        ]
        
        initialConsoles.forEach {
            saveConsole.save(console: $0)
        }
    }    
}
