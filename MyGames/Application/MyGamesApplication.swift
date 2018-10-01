//
//  MyGamesApplication.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class MyGamesAppliation {
    
    private let consoleLocalDataSource = InjectionLocalDataSource.provideConsoleLocalDataSource()
    private let gameLocalDataSource = InjectionLocalDataSource.provideGameLocalDataSource()
            
    public func saveInitialGames() {
        
        if !gameLocalDataSource.haveInitialGames() {
            return
        }
        
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
            gameLocalDataSource.save(game: $0)
        }        
    }
    
    public func saveInitialConsoles() {
        
        if !consoleLocalDataSource.haveConsoleSaved() {
            return
        }
        
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
            consoleLocalDataSource.save(console: $0)
        }
    }    
}
