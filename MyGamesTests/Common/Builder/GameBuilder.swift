//
//  GameBuilder.swift
//  MyGamesTests
//
//  Created by Gabriel Rosa on 01/10/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
@testable import MyGames

public class GameBuilder {
    
    public static func buildWith(_ guid: String = GuidGenerator.generate(),
                               _ title: String = "test-title",
                               _ console: String = "") -> Game {
        return Game(guid: guid,
                    title: title,
                    yearDate: Date(),
                    console: console,
                    completed: false,
                    dateOfCompletion: Date(),
                    personalNotes: "",
                    releasedAt: "")
    }
    
    public static func buildEntryWith(_ guid: String = GuidGenerator.generate(),
                                    _ title: String = "testTitle",
                                    _ console: String = "") -> GameEntry {
        return GameConverter.entityToEntry(buildWith(guid,
                                                     title,
                                                     console))
    }
    
}
