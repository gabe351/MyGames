//
//  SaveConsole.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class SaveConsole {
    
    private weak var localDataSource: ConsoleLocalDataSource?
    
    init(localDataSource: ConsoleLocalDataSource) {
        self.localDataSource = localDataSource
    }
    
    func save(console: Console) {
        localDataSource?.save(console: console)
    }
}
