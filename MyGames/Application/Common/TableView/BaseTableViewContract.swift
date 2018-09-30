//
//  BaseTableViewContract.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol BaseTableViewContract: class {
    func didCellSelected()
    func destroyBy(guid: String)
}
