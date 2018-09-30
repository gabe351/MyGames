//
//  ConsolesPresenter.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class ConsolesPresenter: ConsolesPresenterContract {
    
    private weak var view: ConsolesViewContract?
    private let getConsoles: GetConsoles
    private let deleteConsole: DeleteConsole
    
    init(view: ConsolesViewContract,
         getConsoles: GetConsoles,
         deleteConsole: DeleteConsole) {
        self.view          = view
        self.getConsoles   = getConsoles
        self.deleteConsole = deleteConsole
    }
    
    func loadConsoles() {
        let consoles = getConsoles.all()
        view?.show(consoles: convertConsolesToCellDto(consoles: consoles))
    }
    
    private func convertConsolesToCellDto(consoles: [Console]) -> [CellDto] {
        
        let cells = consoles.map { console -> CellDto in
            CellDto(guid: console.guid,
                    title: console.title,
                    subtitle: console.manufacturer)
        }
        
        return cells
    }
    
    func destroyBy(guid: String) {
        deleteConsole.destroyBy(guid: guid)
    }
}
