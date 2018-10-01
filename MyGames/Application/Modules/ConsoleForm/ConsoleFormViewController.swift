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
    
    @IBOutlet weak var titlePlacehoderLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var titleErrorLabel: UILabel!
    @IBOutlet weak var manufacturerPlaceholderLabel: UILabel!
    @IBOutlet weak var manufacturerTextField: UITextField!
    
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
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setCurrentConsole()
        setupLabels()
    }
    
    @objc func didSaveTapped() {
        
        if isFieldsvalidated() {
            titleErrorLabel.alpha = 0
            let consoleToBeSaved = Console(guid: guid,
                                           title: titleTextField.text ?? "",
                                           manufacturer: manufacturerTextField.text ?? "")
            
            presenter.save(console: consoleToBeSaved)
            navigationController?.popViewController(animated: true)
        } else {
            titleErrorLabel.alpha = 1
        }
        
    }
    
    private func isFieldsvalidated() -> Bool {
        if let titleText = titleTextField.text {
            return !titleText.isEmpty
        }
        
        return false
    }
    
    private func setupLabels() {
        titlePlacehoderLabel.text         = "Title"
        manufacturerPlaceholderLabel.text = "Manufacturer"
    }
}

extension ConsoleFormViewController: ConsoleFormViewContract {
    func setCurrentConsole() {
        if let currentConsole = console {
            guid                       = currentConsole.guid
            titleTextField.text        = currentConsole.title
            manufacturerTextField.text = currentConsole.manufacturer
        }
    }
}
