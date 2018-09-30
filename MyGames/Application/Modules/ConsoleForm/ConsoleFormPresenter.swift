//
//  ConsolePresenter.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class ConsoleFormPresenter: ConsoleFormPresenterContract {
    
    private weak var view: ConsoleFormViewContract?
    private let saveConsole: SaveConsole
    
    init(view: ConsoleFormViewContract,
         saveConsole: SaveConsole) {
        self.view        = view
        self.saveConsole = saveConsole
    }
    
    func save(console: Console) {
        saveConsole.save(console: console)
    }    
}
