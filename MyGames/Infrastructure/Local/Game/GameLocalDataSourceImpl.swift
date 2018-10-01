//
//  ConsoleLocalDataSourceImpl.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import RealmSwift

public class GameLocalDataSourceImpl: GameLocalDataSource {
    
    private static var INSTANCE: GameLocalDataSourceImpl?
    private let realm: Realm
    
    private init(realm: Realm) {
        self.realm = realm
    }
    
    public static func getInstance(realm: Realm) -> GameLocalDataSource {
        
        guard let currentInstance = INSTANCE else {
            INSTANCE = GameLocalDataSourceImpl(realm: realm)
            return INSTANCE!
        }
        
        return currentInstance
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    public func allGames() -> [Game] {
        let entries = Array(realm.objects(GameEntry.self))
        
        return GameConverter.entriesToEntites(entries)
    }
    
    public func findBy(guid: String) -> Game {
        let entry = realm.object(ofType: GameEntry.self,
                                 forPrimaryKey: guid)
        
        guard let foundGame = entry else {
            return GameLocalDataSourceImpl.emptyGame()
        }
        
        return GameConverter.entryToEntity(foundGame)
    }
    
    public func save(game: Game) {
        let entry = GameConverter.entityToEntry(game)
        
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
                let entry = realm.object(ofType: GameEntry.self,
                                                  forPrimaryKey: guid)
                if let foundGame = entry {
                    realm.delete(foundGame)
                }                                
            }
        } catch {
            
        }        
    }
    
    public static func emptyGame() -> Game {
        return Game(guid: "",
                    title: "",
                    yearDate: Date(),
                    console: "",
                    completed: false,
                    dateOfCompletion: Date(),
                    personalNotes: "",
                    releasedAt: "")
    }
}
