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
    
    lazy var presenter: GameDetailPresenterContract = {
        return GameDetailPresenter(view: self,
                                   getGames: InjectionUseCase.provideGetGames())
    }()
    
    var guid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadGameBy(guid: guid)
    }
    
    @objc func didUpdateTapped() {
        let formViewController: GameFormViewController =
            loadNibNamed(GameFormViewController.NIB_NAME,
                         owner: self) ?? GameFormViewController()
        
        navigationController?.pushViewController(formViewController,
                                                 animated: true)
    }
    
    private func setupNavigationBar() {        
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .edit,
                            target: self,
                            action: #selector(didUpdateTapped))
        navigationItem.largeTitleDisplayMode = .never
    }
}

extension GameDetailViewController: GameDetailViewContract {
    
    func show(game: Game) {
        print(game.title)
        //        TODO: Setup outlets
    }
}
