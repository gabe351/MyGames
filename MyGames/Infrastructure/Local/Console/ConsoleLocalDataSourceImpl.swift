//
//  ConsoleLocalDataSourceImpl.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import RealmSwift

public class ConsoleLocalDataSourceImpl: ConsoleLocalDataSource {
    
    private static var INSTANCE: ConsoleLocalDataSourceImpl?
    private let realm: Realm
    
    private init(realm: Realm) {
        self.realm = realm
    }
    
    public static func getInstance(realm: Realm) -> ConsoleLocalDataSource {
        
        guard let currentInstance = INSTANCE else {
            INSTANCE = ConsoleLocalDataSourceImpl(realm: realm)
            return INSTANCE!
        }
        
        return currentInstance
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    public func allConsoles() -> [Console] {
        let entries = Array(realm.objects(ConsoleEntry.self))
        
        return ConsoleConverter.entriesToEntites(entries)
        
    }
    
    public func findBy(guid: String) -> Console {
        let entry = realm.object(ofType: ConsoleEntry.self,
                                 forPrimaryKey: guid)
        
        guard let foundconsole = entry else {
            return ConsoleLocalDataSourceImpl.emptyConsole()
        }
        
        return ConsoleConverter.entryToEntity(foundconsole)
    }
    
    public func save(console: Console) {
        let entry = ConsoleConverter.entityToEntry(console)
        
        do {
            try realm.write {
                realm.add(entry, update: true)
            }
        } catch {
            
        }
    }
    
    public func destroyBy(guid: String) {
        do {
            try realm.write {
                let entry = realm.object(ofType: ConsoleEntry.self,
                                         forPrimaryKey: guid)
                if let foundGame = entry {
                    realm.delete(foundGame)
                }
            }
        } catch {
            
        }
    }
    
    public static func emptyConsole() -> Console {
        return Console(guid: "",
                       title: "",
                       manufacturer: "")
    }        
}
