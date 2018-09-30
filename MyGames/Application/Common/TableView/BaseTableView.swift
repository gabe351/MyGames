//
//  BaseTableView.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class BaseTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var cellDtos = [CellDto]()
    weak var contract: BaseTableViewContract?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.delegate   = self
        self.dataSource = self
        
        let cell = UINib(nibName: BaseTableViewCell.NIB_NAME, bundle: nil)
        self.register(cell, forCellReuseIdentifier: BaseTableViewCell.IDENTIFIER)
    }
    
    func set(elements: [CellDto]) {
        self.cellDtos = elements        
        reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellDtos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BaseTableViewCell.IDENTIFIER,
                                                 for: indexPath as IndexPath) as! BaseTableViewCell
        
        cell.configureView(dto: cellDtos[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contract?.didCellSelected()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            contract?.destroyBy(guid: cellDtos[indexPath.row].guid)
            self.cellDtos.remove(at: indexPath.row)
            self.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
