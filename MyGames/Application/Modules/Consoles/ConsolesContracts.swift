//
//  ConsolesContracts.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol ConsolesViewContract: class {
    func show(consoles: [CellDto])
}

protocol ConsolesPresenterContract: class {
    func loadConsoles()
}
