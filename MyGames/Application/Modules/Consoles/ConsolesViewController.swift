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
                                 getConsoles: InjectionUseCase.provideGetGames())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
            
    override func didAddTapped() {
        let formViewController: ConsoleFormViewController =
            loadNibNamed(ConsoleFormViewController.NIB_NAME,
                         owner: self) ?? ConsoleFormViewController()
        
        navigationController?.pushViewController(formViewController,
                                                 animated: true)        
    }
}

extension ConsolesViewController: ConsolesViewContract {
    
    func show(consoles: [CellDto]) {
        consolesTableView.set(elements: consoles,
                              contract: self)
    }
}

extension ConsolesViewController: BaseTableViewContract {
    
    func didCellSelected() {
        let detailViewController: ConsoleDetailViewController =
            loadNibNamed(ConsoleDetailViewController.NIB_NAME,
                         owner: self) ?? ConsoleDetailViewController()
        
        navigationController?.pushViewController(detailViewController,
                                                 animated: true)
    }
}
