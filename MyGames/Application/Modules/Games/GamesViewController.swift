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
            ], contract: self)
    }
            
    override func didAddTapped() {
        let formViewController: GameFormViewController =
            loadNibNamed(GameFormViewController.NIB_NAME,
                         owner: self) ?? GameFormViewController()
        
        navigationController?.pushViewController(formViewController,
                                                 animated: true)
    }
}

extension GamesViewController: BaseTableViewContract {
    
    func didCellSelected() {
        let detailViewController: GameDetailViewController =
            loadNibNamed(GameDetailViewController.NIB_NAME,
                         owner: self) ?? GameDetailViewController()
        
        navigationController?.pushViewController(detailViewController,
                                                 animated: true)        
    }
}
