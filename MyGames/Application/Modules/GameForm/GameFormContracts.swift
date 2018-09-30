//
//  GameFormContracts.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol GameFormViewContract: class {
    func setCurrentGame()
}

protocol GameFormPresenterContract: class {    
    func save(game: Game)
}
