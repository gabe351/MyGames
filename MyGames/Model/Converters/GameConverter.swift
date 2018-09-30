//
//  GameConverter.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class GameConverter {
    
    static func entityToEntry(_ entity: Game) -> GameEntry {
        
        let entry = GameEntry()
        
        entry.guid             = entity.guid
        entry.title            = entity.title
        entry.year             = entity.year
        entry.console          = entity.console
        entry.completed        = entity.completed
        entry.dateOfCompletion = entity.dateOfCompletion
        entry.personalNotes    = entity.personalNotes

        return entry
    }
    
    static func entryToEntity(_ entry: GameEntry) -> Game {
        
        return Game(guid: entry.guid,
                    title: entry.title,
                    year: entry.year,
                    console: entry.console,
                    completed: entry.completed,
                    dateOfCompletion: entry.dateOfCompletion,
                    personalNotes: entry.personalNotes,
                    releasedAt: getReleasedAtFormated(date: Date()))
        //        TODO: Get the year - 16 years ago
    }
    
    static func entitiesToEntries(_ entites: [Game]) -> [GameEntry] {
        
        let entries = entites.map { game -> GameEntry in
            entityToEntry(game)
        }
        
        return entries
    }
    
    static func entriesToEntites(_ entries: [GameEntry]) -> [Game] {
        
        let entities = entries.map { gameEntry -> Game in
            entryToEntity(gameEntry)
        }
        
        return entities
    }
    
    private static func getReleasedAtFormated(date: Date) -> String {
        let year  = getYearFrom(date: date)
        let older = getYearFrom(date: Date()) - year
        
        if older == 0 { return "From this year" }
        
        return "\(older) years old"
    }
    
    private static func getYearFrom(date: Date) -> Int {
        let calendar     = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let yearFromDate = calendar?.component(NSCalendar.Unit.year, from: date)
        
        guard let year = yearFromDate else {
            return 0
        }
        return year
    }
}

