//
//  DeleteConsole.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class DeleteConsole {
    
    private weak var localDataSource: ConsoleLocalDataSource?
    
    init(localDataSource: ConsoleLocalDataSource) {
        self.localDataSource = localDataSource
    }
    
    func destroyBy(guid: String) {
        localDataSource?.destroyBy(guid: guid)
    }
}
