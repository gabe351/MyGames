//
//  ConsoleDetailViewController.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class ConsoleDetailViewController: UIViewController {
    
    @IBOutlet weak var consoleTitlePlaceholderLabel: UILabel!
    @IBOutlet weak var consoleTitleLabel: UILabel!
    @IBOutlet weak var consoleManufacturerPlaceholderLabel: UILabel!
    @IBOutlet weak var consoleManufacturerLabel: UILabel!
        
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
        setupPlaceholderLabels()
    }
    
    @objc func didUpdateTapped() {
        let formViewController: ConsoleFormViewController =
            loadNibNamed(ConsoleFormViewController.NIB_NAME,
                         owner: self) ?? ConsoleFormViewController()
        
        navigationController?.pushViewController(formViewController,
                                                 animated: true)
    }
    
    private func setupPlaceholderLabels() {
        consoleTitlePlaceholderLabel.text        = "Title"
        consoleManufacturerPlaceholderLabel.text = "manufacturer"
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .edit,
                            target: self,
                            action: #selector(didUpdateTapped))
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "Console Detail"
    }
}

extension ConsoleDetailViewController: ConsoleDetailViewContract {
    
    func show(console: Console) {
        consoleTitleLabel.text        = console.title
        consoleManufacturerLabel.text = console.manufacturer
    }
}
