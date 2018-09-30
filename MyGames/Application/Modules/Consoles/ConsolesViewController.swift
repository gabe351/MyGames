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
    
    lazy var presenter: ConsolesPresenterContract = {
        return ConsolesPresenter(view: self,
                                 getConsoles: InjectionUseCase.provideGetConsoles(),
                                 deleteConsole: InjectionUseCase.provideDeleteConsole())
    }()
    
    var filteredConsoles = [CellDto]()
    var consoles         = [CellDto]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadConsoles()
        consolesTableView.contract = self
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
        let formViewController: ConsoleFormViewController =
            loadNibNamed(ConsoleFormViewController.NIB_NAME,
                         owner: self) ?? ConsoleFormViewController()
        
        navigationController?.pushViewController(formViewController,
                                                 animated: true)        
    }
}

extension ConsolesViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredConsoles = consoles.filter({( console : CellDto) -> Bool in
            return console.title.lowercased().contains(searchText.lowercased())
        })
        
        consolesTableView.set(elements: filteredConsoles)
        
        if searchBarIsEmpty() {
            consolesTableView.set(elements: consoles)
        }
    }
}

extension ConsolesViewController: ConsolesViewContract {
    
    func show(consoles: [CellDto]) {
        self.consoles = consoles
        consolesTableView.set(elements: consoles)
    }
    
    func destroyBy(guid: String) {
        presenter.destroyBy(guid: guid)
    }
}

extension ConsolesViewController: BaseTableViewContract {
    
    func didCellSelected(guid: String) {
        let detailViewController: ConsoleDetailViewController =
            loadNibNamed(ConsoleDetailViewController.NIB_NAME,
                         owner: self) ?? ConsoleDetailViewController()
        
        detailViewController.guid = guid
        
        navigationController?.pushViewController(detailViewController,
                                                 animated: true)
    }
}
