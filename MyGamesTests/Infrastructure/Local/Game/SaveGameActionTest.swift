//
//  SaveActionTestGameLocalDataSource.swift
//  MyGamesTests
//
//  Created by Gabriel Rosa on 01/10/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

@testable import MyGames
import Foundation
import RealmSwift
import Quick
import Nimble

class SaveGameActionTest: QuickSpec {
    
    override func spec() {
        
        realmDeleteIfMigrationNeeded()
        
        beforeSuite {
            realmInMemoryIdentifierConfig(name: self.name)
        }
        
        beforeEach {
            realmClean()
        }
                
        describe("#save") {
            
            let realm = realmInstance()
            
            let localDataSource = GameLocalDataSourceImpl
                .getInstance(realm: realm)
            
            let firstGuid  = GuidGenerator.generate()
            var result     = [GameEntry]()
            
            let findAction: Action = Action() {
                result = Array(realm.objects(GameEntry.self))
            }
            
            
            context("When try to save one objetc") {
                
                beforeEach {
                    execute(action: findAction) {
                        
                        localDataSource.save(game: GameBuilder.buildWith(firstGuid))
                    }
                }
                
                it("Should have same object") {
                    expect(result).to(haveCount(1))
                    expect(result.first?.guid).to(equal(firstGuid))
                }
            }
            
            context("When try two objects with same guid") {
                
                beforeEach {
                    execute(action: findAction) {
                        localDataSource.save(game: GameBuilder.buildWith(firstGuid))
                        localDataSource.save(game: GameBuilder.buildWith(firstGuid))
                    }
                }
                
                
                it("Should have only one object") {
                    expect(result).to(haveCount(1))
                }
            }
        }
    }
}
