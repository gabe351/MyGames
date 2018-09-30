//
//  ConsoleLocalDataSource.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public protocol ConsoleLocalDataSource: class {
    
    func allConsoles() -> [Console]
    func findBy(guid: String) -> Console
    func save(console: Console)
    func destroyBy(guid: String)
}
