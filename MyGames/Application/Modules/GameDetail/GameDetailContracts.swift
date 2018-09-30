//
//  GameDetailContracts.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol GameDetailViewContract: class {
    
    func show(game: Game)
    
}

protocol GameDetailPresenterContract: class {
    func loadGameBy(guid: String)
}
