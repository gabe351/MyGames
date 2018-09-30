//
//  GamesViewController.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class GamesViewController: BaseViewController {
    
    @IBOutlet weak var gamesTableView: BaseTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gamesTableView.set(elements: [
            CellDto(title: "abc", subtitle: "adw"),
            CellDto(title: "abc", subtitle: "adw"),
            CellDto(title: "abc", subtitle: "adw"),
            CellDto(title: "abc", subtitle: "adw"),
            CellDto(title: "abc", subtitle: "adw"),
            CellDto(title: "abc", subtitle: "adw"),
            CellDto(title: "abc", subtitle: "adw"),
            CellDto(title: "abc", subtitle: "adw"),
            CellDto(title: "abc", subtitle: "adw"),
            CellDto(title: "abc", subtitle: "adw"),
            CellDto(title: "abc", subtitle: "adw"),
            CellDto(title: "abc", subtitle: "adw"),
            CellDto(title: "abc", subtitle: "adw")
            ])                                
    }
    
    override func setupSearchBar() {
        
    }
}
