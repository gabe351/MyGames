//
//  GetConsoles.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class GetConsoles {
    
    private weak var localDataSource: ConsoleLocalDataSource?
    
    init(localDataSource: ConsoleLocalDataSource) {
        self.localDataSource = localDataSource
    }
    
    func all() -> [Console] {
        guard let foundConsoles = localDataSource?.allConsoles() else {
            return []
        }
        
        return foundConsoles
    }
    
    func findBy(guid: String) -> Console {
        guard let foundConsole = localDataSource?.findBy(guid: guid) else {
            return ConsoleLocalDataSourceImpl.emptyConsole()
        }
        
        return foundConsole
    }    
}
