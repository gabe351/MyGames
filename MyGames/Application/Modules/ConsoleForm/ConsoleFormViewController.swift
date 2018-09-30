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
    
    lazy var presenter: ConsoleFormPresenterContract = {
        return ConsoleFormPresenter(view: self,
                                    saveConsole: InjectionUseCase.provideSaveConsole())
    }()
    
    var console: Console?
    var guid = GuidGenerator.generate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .save,
                            target: self,
                            action: #selector(didSaveTapped))
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setCurrentConsole()
    }
    
    @objc func didSaveTapped() {
        let consoleToBeSaved = Console(guid: guid,
                                       title: "",
                                       manufacturer: "")
        
        presenter.save(console: consoleToBeSaved)
        navigationController?.popViewController(animated: true)
    }
}

extension ConsoleFormViewController: ConsoleFormViewContract {
    func setCurrentConsole() {
        if let currentConsole = console {
            guid = currentConsole.guid
            //            fill all fields
        }
    }
}
