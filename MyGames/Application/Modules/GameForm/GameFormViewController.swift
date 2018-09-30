//
//  GameFormViewController.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class GameFormViewController: UIViewController {
    
    public static let NIB_NAME = "GameFormViewController"
    
    lazy var presenter: GameFormPresenterContract = {
        return GameFormPresenter(view: self,
                                 saveGame: InjectionUseCase.provideSaveGame())
    }()
    
    var game: Game?
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
        setCurrentGame()
    }
    
    @objc func didSaveTapped() {
        let gemeToBeSaved = Game(guid: guid,
                                 title: "",
                                 year: "",
                                 console: "",
                                 completed: false,
                                 dateOfCompletion: Date(),
                                 personalNotes: "",
                                 releasedAt: "")
        presenter.save(game: gemeToBeSaved)
        navigationController?.popViewController(animated: true)
    }
}

extension GameFormViewController: GameFormViewContract {
    func setCurrentGame() {
        if let currentGame = game {
            guid = currentGame.guid
            //            fill all fields
        }
    }    
}
