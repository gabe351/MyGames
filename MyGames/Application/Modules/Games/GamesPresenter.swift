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
    
    init(view: GamesViewContract,
         getGames: GetGames) {
        self.view     = view
        self.getGames = getGames
    }
    
    func loadGames() {
        let games = getGames.allGames()
        view?.show(games: convertGameToCellDto(games: games))
    }
    
    private func convertGameToCellDto(games: [Game]) -> [CellDto] {
        
        let cells = games.map { game -> CellDto in
            CellDto(title: game.title,
                    subtitle: game.releasedAt)
        }
        
        return cells
    }
}
