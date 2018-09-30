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
    
    lazy var presenter: GamesPresenterContract = {
        return GamesPresenter(view: self,
                              getGames: InjectionUseCase.provideGetGames(),
                              deleteGame: InjectionUseCase.provideDeleteGame())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadGames()
    }
            
    override func didAddTapped() {
        let formViewController: GameFormViewController =
            loadNibNamed(GameFormViewController.NIB_NAME,
                         owner: self) ?? GameFormViewController()
        
        navigationController?.pushViewController(formViewController,
                                                 animated: true)
    }
}

extension GamesViewController: GamesViewContract {
    
    func show(games: [CellDto]) {
        gamesTableView.set(elements: games,
                           contract: self)
    }
    
    func destroyBy(guid: String) {
        presenter.destroyBy(guid: guid)
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
