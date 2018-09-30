//
//  GameEntry.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import RealmSwift

class GameEntry: Object {
        
    @objc dynamic var guid             = String()
    @objc dynamic var title            = String()
    @objc dynamic var year             = String()
    @objc dynamic var console          = String()
    @objc dynamic var completed        = Bool()
    @objc dynamic var dateOfCompletion = Date()
    @objc dynamic var personalNotes    = String()
    
    override static func primaryKey() -> String? {
        return "guid"
    }
}
