//
//  GuidGenerator.swift
//  MyGames
//
//  Created by Gabriel Rosa on 30/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public class GuidGenerator {
    
    public class func generate() -> String {
        let guid = UUID().uuidString
        
        return guid
    }
}
