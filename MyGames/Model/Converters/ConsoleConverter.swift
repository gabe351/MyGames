//
//  ConsoleConverter.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class ConsoleConverter {
    
    static func entityToEntry(_ entity: Console) -> ConsoleEntry {
        
        let entry = ConsoleEntry()
        
        entry.guid             = entity.guid
        entry.title            = entity.title
        entry.manufacturer      = entity.manufacturer
        
        return entry
    }
    
    static func entryToEntity(_ entry: ConsoleEntry) -> Console {
        return Console(guid: entry.guid,
                       title: entry.title,
                       manufacturer: entry.manufacturer)
    }
    
    static func entitiesToEntries(_ entites: [Console]) -> [ConsoleEntry] {
        
        let entries = entites.map {
            console -> ConsoleEntry in entityToEntry(console)
        }
        
        return entries
    }
    
    static func entriesToEntites(_ entries: [ConsoleEntry]) -> [Console] {
        
        let entities = entries.map {
            consoleEntry -> Console in entryToEntity(consoleEntry)
        }
        
        return entities
    }
}

