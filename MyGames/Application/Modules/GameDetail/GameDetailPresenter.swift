//
//  GameDetailPresenter.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class GameDetailPresenter: GameDetailPresenterContract {
    
    private weak var view: GameDetailViewContract?
    private let getGames: GetGames
    
    init(view: GameDetailViewContract,
         getGames: GetGames) {
        self.view     = view
        self.getGames = getGames
    }
    
    func loadGameBy(guid: String) {
        let game = getGames.findBy(guid: guid)
        view?.show(game: game)
    }
}
