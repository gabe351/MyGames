//
//  ConsoleDetailPresenter.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class ConsoleDetailPresenter: ConsoleDetailPresenterContract {
    
    private weak var view: ConsoleDetailViewContract?
    private let getConsoles: GetConsoles
    
    init(view: ConsoleDetailViewContract,
         getConsoles: GetConsoles) {
        self.view          = view
        self.getConsoles   = getConsoles
    }
    
    func loadConsoleBy(guid: String) {
        let console = getConsoles.findBy(guid: guid)
        view?.show(console: console)
    }
}
