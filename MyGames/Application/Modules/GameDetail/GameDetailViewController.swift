//
//  GamesDetailViewController.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class GameDetailViewController: UIViewController {
    
    public static let NIB_NAME = "GameDetailViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .edit,
                            target: self,
                            action: #selector(didUpdateTapped))
        navigationItem.largeTitleDisplayMode = .never
    }
    
    @objc func didUpdateTapped() {
        let formViewController: GameFormViewController =
            loadNibNamed(GameFormViewController.NIB_NAME,
                         owner: self) ?? GameFormViewController()
        
        navigationController?.pushViewController(formViewController,
                                                 animated: true)
    }
}
