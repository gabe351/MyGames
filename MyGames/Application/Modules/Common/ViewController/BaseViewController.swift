//
//  BaseViewController.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

public class BaseViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
    }
    
    func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        setupSearchBar()
    }
    
    func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
    }
}
