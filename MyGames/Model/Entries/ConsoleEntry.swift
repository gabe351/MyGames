//
//  ConsoleEntry.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import RealmSwift

class ConsoleEntry: Object {
    
    @objc dynamic var guid        = String()
    @objc dynamic var title       = String()
    @objc dynamic var manufacturer = String()
    
    override static func primaryKey() -> String? {
        return "guid"
    }
}
