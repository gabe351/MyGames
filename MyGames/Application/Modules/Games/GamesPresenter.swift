//
//  GamesPresenter.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class GamesPresenter: GamesPresenterContract {
    
    private weak var view: GamesViewContract?
    private let getGames: GetGames
    private let deleteGame: DeleteGame
    
    init(view: GamesViewContract,
         getGames: GetGames,
         deleteGame: DeleteGame) {
        self.view       = view
        self.getGames   = getGames
        self.deleteGame = deleteGame
    }
    
    func loadGames() {
        let games = getGames.all()
        view?.show(games: convertGameToCellDto(games: games))
    }
    
    private func convertGameToCellDto(games: [Game]) -> [CellDto] {
        
        let cells = games.map { game -> CellDto in
            CellDto(guid: game.guid,
                    title: game.title,
                    subtitle: game.releasedAt)
        }
        
        return cells
    }
    
    func destroyBy(guid: String) {
        deleteGame.destroyBy(guid: guid)
    }
}
