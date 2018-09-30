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
    
    init(view: GameFormViewContract,
         saveGame: SaveGame) {
        self.view     = view
        self.saveGame = saveGame
    }
    
    func save(game: Game) {
        saveGame.save(game: game)
    }
}
