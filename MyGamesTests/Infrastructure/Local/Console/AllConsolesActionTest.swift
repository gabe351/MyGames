//
//  AllConsolesActionTest.swift
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

class AllConsolesActionTest: QuickSpec {
    
    override func spec() {
        
        realmDeleteIfMigrationNeeded()
        
        beforeSuite {
            realmInMemoryIdentifierConfig(name: self.name)
        }
        
        beforeEach {
            realmClean()
        }
                        
        describe("#all") {
            
            let realm = realmInstance()
            
            let localDataSource = ConsoleLocalDataSourceImpl
                .getInstance(realm: realm)
            
            let firstGuid  = GuidGenerator.generate()
            let secondGuid = GuidGenerator.generate()
            let thirdGuid  = GuidGenerator.generate()
            
            var result     = [Console]()
            
            let findAction: Action = Action() {
                result = localDataSource.allConsoles()
            }
            
            context("When have saved objects") {
                
                beforeEach {
                    execute(action: findAction) {
                        writeOnRealm() { (realm) in
                            realm.add(ConsoleBuilder.buildEntryWith(firstGuid))
                            realm.add(ConsoleBuilder.buildEntryWith(secondGuid))
                            realm.add(ConsoleBuilder.buildEntryWith(thirdGuid))
                        }
                    }
                }
                
                it("Should have same objects") {
                    expect(result).to(haveCount(3))
                }
            }
            
            context("When do not have saved objects") {
                
                beforeEach {
                    execute(action: findAction) {}
                }
                                
                it("Should have none objects") {
                    expect(result).to(beEmpty())
                }
            }
        }
    }
}


