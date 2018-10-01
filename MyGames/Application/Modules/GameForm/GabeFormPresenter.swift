//
//  GabeFormPresenter.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class GameFormPresenter: GameFormPresenterContract {
    
    private weak var view: GameFormViewContract?
    private let saveGame: SaveGame
    private let getConsoles: GetConsoles
    
    init(view: GameFormViewContract,
         saveGame: SaveGame,
         getConsoles: GetConsoles) {
        self.view        = view
        self.saveGame    = saveGame
        self.getConsoles = getConsoles
    }
    
    func save(game: Game) {
        saveGame.save(game: game)
    }
    
    func loadConsoles() {
        let consoles = getConsoles.all()
        let titles = consoles.map { console -> String in
            console.title
        }
        
        view?.show(consoleTitles: titles)
    }
}
