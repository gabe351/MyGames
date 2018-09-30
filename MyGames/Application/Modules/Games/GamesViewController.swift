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
    
    var filteredGames    = [CellDto]()
    var games            = [CellDto]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadGames()
        gamesTableView.contract = self
    }
    
    override func setupSearchBar() {
        
        definesPresentationContext = true
        
        searchController.searchResultsUpdater                 = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder                = "Search Games"
        
        navigationItem.searchController            = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
            
    override func didAddTapped() {
        let formViewController: GameFormViewController =
            loadNibNamed(GameFormViewController.NIB_NAME,
                         owner: self) ?? GameFormViewController()
        
        navigationController?.pushViewController(formViewController,
                                                 animated: true)
    }
}

extension GamesViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredGames = games.filter({( game : CellDto) -> Bool in
            return game.title.lowercased().contains(searchText.lowercased())
            || game.extra.lowercased().contains(searchText.lowercased())
        })
        
        gamesTableView.set(elements: filteredGames)
        
        if searchBarIsEmpty() {
            gamesTableView.set(elements: games)
        }
    }
}

extension GamesViewController: GamesViewContract {
    
    func show(games: [CellDto]) {
        self.games = games
        gamesTableView.set(elements: games)
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
