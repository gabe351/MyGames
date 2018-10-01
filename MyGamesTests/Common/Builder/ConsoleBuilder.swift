//
//  ConsoleBuilder.swift
//  MyGamesTests
//
//  Created by Gabriel Rosa on 01/10/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
@testable import MyGames

class ConsoleBuilder {
        
    public static func buildWith(_ guid: String = GuidGenerator.generate(),
                                  _ title: String = "test-title",
                                  _ manufacturer: String = "") -> Console {
        return Console(guid: guid,
                       title: title,
                       manufacturer: manufacturer)
    }
    
    public static func buildEntryWith(_ guid: String = GuidGenerator.generate(),
                                      _ title: String = "test-title",
                                      _ manufacturer: String = "") -> ConsoleEntry {
        return ConsoleConverter.entityToEntry(buildWith(guid,
                                                        title,
                                                        manufacturer))
    }
}

