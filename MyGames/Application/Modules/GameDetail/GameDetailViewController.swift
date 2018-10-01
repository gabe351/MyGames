//
//  GamesDetailViewController.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class GameDetailViewController: UIViewController {
    
    
    @IBOutlet weak var titlePlaceholderLabel: UILabel!
    @IBOutlet weak var tiitleLabel: UILabel!
    @IBOutlet weak var yearPlaceholderLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var consolePlaceholderLabel: UILabel!
    @IBOutlet weak var consoleLabel: UILabel!
    @IBOutlet weak var completedPlaceholderLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var completionDatePlaceholderLabel: UILabel!
    @IBOutlet weak var completionDateLabel: UILabel!
    @IBOutlet weak var notesPlaceholderLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    public static let NIB_NAME = "GameDetailViewController"
    
    lazy var presenter: GameDetailPresenterContract = {
        return GameDetailPresenter(view: self,
                                   getGames: InjectionUseCase.provideGetGames())
    }()
    
    var guid = ""
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadGameBy(guid: guid)
        setupPlacehoderLabels()
    }
    
    @objc func didUpdateTapped() {
        let formViewController: GameFormViewController =
            loadNibNamed(GameFormViewController.NIB_NAME,
                         owner: self) ?? GameFormViewController()
        formViewController.game = game
        navigationController?.pushViewController(formViewController,
                                                 animated: true)
    }
    
    private func setupNavigationBar() {        
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .edit,
                            target: self,
                            action: #selector(didUpdateTapped))
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "Game Detail"
    }
    
    private func setupPlacehoderLabels() {
        titlePlaceholderLabel.text          = "Title: "
        yearPlaceholderLabel.text           = "Game year: "
        consolePlaceholderLabel.text        = "Console: "
        completedPlaceholderLabel.text      = "Completed: "
        completionDatePlaceholderLabel.text = "Completed at: "
        notesPlaceholderLabel.text          = "Personal Notes:"
    }
}

extension GameDetailViewController: GameDetailViewContract {
    
    func show(game: Game) {
        self.game                = game
        tiitleLabel.text         = game.title
        yearLabel.text           = DateUtils.getReleasedAtFormated(date: game.yearDate)
        consoleLabel.text        = game.console
        notesLabel.text          = game.personalNotes
        completedLabel.text      = getCompleted(game.completed)
        setupCompletionAt(game)                
    }
    
    private func setupCompletionAt(_ game: Game) {
        if !game.completed {
            completionDateLabel.text = "This game is no completed yet"
            return
        }
        
        completionDateLabel.text = DateUtils.buildFormatedDate(game.dateOfCompletion)
    }
    
    private func getCompleted(_ isCompleted: Bool) -> String {
        if isCompleted { return "Yes" }
        
        return "No"
    }
}

