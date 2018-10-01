//
//  GameFormViewController.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class GameFormViewController: UIViewController {
    
    
    @IBOutlet weak var titlePlaceholderLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var titleErrorMessage: UILabel!
    @IBOutlet weak var yearPlaceholderLabel: UILabel!
    @IBOutlet weak var yearDatePicker: UIDatePicker!
    @IBOutlet weak var consolePlaceholderLabel: UILabel!
    @IBOutlet weak var consolePicker: UIPickerView!
    @IBOutlet weak var completedPlaceholderLabel: UILabel!
    @IBOutlet weak var completedSwitch: UISwitch!
    @IBOutlet weak var completionDatePlaceholderLabel: UILabel!
    @IBOutlet weak var completionDatePicker: UIDatePicker!
    @IBOutlet weak var notesPlaceholderLabel: UILabel!
    @IBOutlet weak var notesTextView: UITextView!
    
    public static let NIB_NAME = "GameFormViewController"
    
    lazy var presenter: GameFormPresenterContract = {
        return GameFormPresenter(view: self,
                                 saveGame: InjectionUseCase.provideSaveGame(),
                                 getConsoles: InjectionUseCase.provideGetConsoles())
    }()
    
    var game: Game?
    var guid       = GuidGenerator.generate()
    var consoleTitles = [String]()
    var selectedConsole = ""
    
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
        
        setuoLabels()
        setCurrentGame()
        presenter.loadConsoles()
        
        consolePicker.delegate   = self
        consolePicker.dataSource = self
    }
    
    @objc func didSaveTapped() {
        if isMandatoryFieldsEmpty() {
            titleErrorMessage.alpha = 1
            return
        }
        
        titleErrorMessage.alpha = 0
        
        let gemeToBeSaved = Game(guid: guid,
                                 title: titleTextField.text ?? "",
                                 yearDate: yearDatePicker.date,
                                 console: selectedConsole,
                                 completed: completedSwitch.isOn,
                                 dateOfCompletion: completionDatePicker.date,
                                 personalNotes: notesTextView.text ?? "",
                                 releasedAt: "")
        
        presenter.save(game: gemeToBeSaved)
        navigationController?.popViewController(animated: true)
    }
    
    private func setuoLabels() {
        titlePlaceholderLabel.text          = "Title"
        yearPlaceholderLabel.text           = "Game year"
        consolePlaceholderLabel.text        = "Console"
        completedPlaceholderLabel.text      = "Is game completed?"
        completionDatePlaceholderLabel.text = "Date of completion"
        notesPlaceholderLabel.text          = "Personal notes"
    }
    
    private func isMandatoryFieldsEmpty() -> Bool {
        if let titleText = titleTextField.text {
            return titleText.isEmpty
        }
        
        return false
    }
}

extension GameFormViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return consoleTitles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return consoleTitles[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedConsole = consoleTitles[row]
    }
}

extension GameFormViewController: GameFormViewContract {
    
    func show(consoleTitles: [String]) {
        self.consoleTitles = consoleTitles
    }
    
    func setCurrentGame() {
        if let currentGame = game {
            guid = currentGame.guid
            titleTextField.text       = currentGame.title
            yearDatePicker.date       = currentGame.yearDate
            completedSwitch.isOn      = currentGame.completed
            completionDatePicker.date = currentGame.dateOfCompletion
            notesTextView.text        = currentGame.personalNotes
        }
    }    
}
