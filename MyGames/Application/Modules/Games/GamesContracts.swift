//
//  GamesContracts.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol GamesViewContract: class {
    func show(games: [CellDto])
}

protocol GamesPresenterContract: class {
    func loadGames()
}
