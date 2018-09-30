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
        
        let initalGames = [
            Game(guid: "first-fake-game-guid",
                 title: "God of war",
                 year: "2018",
                 console: "PS4",
                 completed: true,
                 dateOfCompletion: Date(),
                 personalNotes: "That is a good game",
                 releasedAt: "1 year ago"),
            Game(guid: "second-fake-game-guid",
                 title: "The Witcher 3",
                 year: "2018",
                 console: "PS4",
                 completed: true,
                 dateOfCompletion: Date(),
                 personalNotes: "That is a good game",
                 releasedAt: "2 years ago"),
            Game(guid: "third-fake-game-guid",
                 title: "Last of Us",
                 year: "2018",
                 console: "PS4",
                 completed: true,
                 dateOfCompletion: Date(),
                 personalNotes: "That is a good game",
                 releasedAt: "3 years ago")
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
