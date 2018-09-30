//
//  ConsoleFormViewController.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class ConsoleFormViewController: UIViewController {
    
    public static let NIB_NAME = "ConsoleFormViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .save,
                            target: self,
                            action: #selector(didSaveTapped))
    }
    
    @objc func didSaveTapped() {
        //        If save success
        navigationController?.popViewController(animated: true)
    }
}
