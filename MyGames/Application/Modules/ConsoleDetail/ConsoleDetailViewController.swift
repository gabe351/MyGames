//
//  ConsoleDetailViewController.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class ConsoleDetailViewController: UIViewController {
    
    public static let NIB_NAME = "ConsoleDetailViewController"
    
    lazy var presenter: ConsoleDetailPresenterContract = {
        return ConsoleDetailPresenter(view: self,
                                      getConsoles: InjectionUseCase.provideGetConsoles())
    }()
    
    var guid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadConsoleBy(guid: guid)
    }
    
    @objc func didUpdateTapped() {
        let formViewController: ConsoleFormViewController =
            loadNibNamed(ConsoleFormViewController.NIB_NAME,
                         owner: self) ?? ConsoleFormViewController()
        
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

extension ConsoleDetailViewController: ConsoleDetailViewContract {
    
    func show(console: Console) {
        print(console.title)
        //        TODO: Update view
    }
}
