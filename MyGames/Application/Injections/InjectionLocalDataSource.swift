//
//  InjectionLocalDataSource.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import RealmSwift

public class InjectionLocalDataSource {
    static let realm = try! Realm()
        
    public static func provideGameLocalDataSource() -> GameLocalDataSource {
        return GameLocalDataSourceImpl.getInstance(realm: realm)
    }
    
    public static func provideConsoleLocalDataSource() -> ConsoleLocalDataSource {
        return ConsoleLocalDataSourceImpl.getInstance(realm: realm)
    }    
}
