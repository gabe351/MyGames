//
//  ConsolesViewController.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class ConsolesViewController: BaseViewController {
    
    @IBOutlet weak var consolesTableView: BaseTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        consolesTableView.set(elements: [
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
