//
//  Action.swift
//  MyGamesTests
//
//  Created by Gabriel Rosa on 01/10/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

struct Action {
    let block: () -> ()
    
    func call() {
        block()
    }
}

func execute(action: Action, _ setup: () -> () ) {
    setup()
    action.block()
}
