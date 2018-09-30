//
//  GameFormViewController.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class GameFormViewController: UIViewController {
    
    @IBOutlet weak var gameFormNavBar: UINavigationBar!
    
    public static let NIB_NAME = "GameFormViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .save,
                            target: self,
                            action: #selector(didSaveTapped))
        navigationItem.largeTitleDisplayMode = .never
    }
    
    @objc func didSaveTapped() {
//        If save success        
        navigationController?.popViewController(animated: true)
    }
}
