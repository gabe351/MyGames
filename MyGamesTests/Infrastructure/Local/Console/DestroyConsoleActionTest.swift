//
//  DestroyConsoleActionTest.swift
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

class DestroyConsoleActionTest: QuickSpec {
    
    override func spec() {
        
        realmDeleteIfMigrationNeeded()
        
        beforeSuite {
            realmInMemoryIdentifierConfig(name: self.name)
        }
        
        beforeEach {
            realmClean()
        }
                        
        describe("#destroy") {
            
            let realm = realmInstance()
            
            let localDataSource = ConsoleLocalDataSourceImpl
                .getInstance(realm: realm)
            
            let firstGuid  = GuidGenerator.generate()
            let secondGuid = GuidGenerator.generate()
            let thirdGuid  = GuidGenerator.generate()
            
            var result     = [ConsoleEntry]()
            
            let findAction: Action = Action() {
                result = Array(realm.objects(ConsoleEntry.self))
            }
            
            context("When have saved objects") {
                
                beforeEach {
                    execute(action: findAction) {
                        writeOnRealm() { (realm) in
                            realm.add(ConsoleBuilder.buildEntryWith(firstGuid))
                            realm.add(ConsoleBuilder.buildEntryWith(secondGuid))
                            realm.add(ConsoleBuilder.buildEntryWith(thirdGuid))
                        }
                        
                        localDataSource.destroyBy(guid: firstGuid)
                        localDataSource.destroyBy(guid: secondGuid)
                    }
                }
                
                it("Should have only one objects") {
                    expect(result).to(haveCount(1))
                    expect(result.first?.guid).to(equal(thirdGuid))
                }
            }
            
            context("When do not have saved objects") {
                
                beforeEach {
                    execute(action: findAction) {
                        localDataSource.destroyBy(guid: firstGuid)
                    }
                }
                
                it("Should have none objects") {
                    expect(result).to(beEmpty())
                }
            }
        }
    }
}



