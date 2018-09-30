//
//  ConsoleFormContracts.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol ConsoleFormViewContract: class {
    
    func setCurrentConsole()
    func save(console: Console)
}

protocol ConsoleFormPresenterContract {
    
    func save(console: Console)
}
