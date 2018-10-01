//
//  RealmShared.swift
//  MyGamesTests
//
//  Created by Gabriel Rosa on 01/10/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import RealmSwift

var realm: Realm?

public func realmDeleteIfMigrationNeeded() {
    Realm.Configuration.defaultConfiguration.deleteRealmIfMigrationNeeded = true
}

public func realmInstance() -> Realm {
    if let realmInstance = realm { return realmInstance }
    realmDeleteIfMigrationNeeded()
    realm = try! Realm()
    return realm!
}

public func realmClean() {
    writeOnRealm { realm in
        realm.deleteAll()
        try! realm.commitWrite()
    }
}

public func realmInMemoryIdentifierConfig(name: String){
    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = name
}

func writeOnRealm(_ block: @escaping (Realm) -> ()) {
    try! realmInstance().write {
        block(realmInstance())
    }
}
    


