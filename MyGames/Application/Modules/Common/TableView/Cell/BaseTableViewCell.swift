//
//  BaseTableViewCell.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    public static let NIB_NAME   = "BaseTableViewCell"
    public static let IDENTIFIER = "BaseTableViewCellIdentifier"
    
    
    func configureView(dto: CellDto) {
        titleLabel.text    = dto.title
        subtitleLabel.text = dto.subtitle
    }
}
