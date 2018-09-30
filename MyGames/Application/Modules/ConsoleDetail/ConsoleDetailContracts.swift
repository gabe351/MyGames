//
//  ConsoleDetailContracts.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol ConsoleDetailViewContract: class {
    func show(console: Console)
}

protocol ConsoleDetailPresenterContract: class {
    func loadConsoleBy(guid: String)
}
