//
//  SaveActionTestConsoleLocalDataSource.swift
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

class SaveConsoleActionTest: QuickSpec {
    
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
            
            let localDataSource = ConsoleLocalDataSourceImpl
                .getInstance(realm: realm)
            
            let firstGuid  = GuidGenerator.generate()
            var result     = [ConsoleEntry]()
            
            let findAction: Action = Action() {
                result = Array(realm.objects(ConsoleEntry.self))
            }
            
            
            xcontext("When try to save one objetc") {
                
                beforeEach {
                    execute(action: findAction) {
                        localDataSource.save(console: ConsoleBuilder.buildWith(firstGuid))
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
                        localDataSource.save(console: ConsoleBuilder.buildWith(firstGuid))
                        localDataSource.save(console: ConsoleBuilder.buildWith(firstGuid))
                    }
                }
                
                
                it("Should have only one object") {
                    expect(result).to(haveCount(1))
                }
            }
        }
    }
}

