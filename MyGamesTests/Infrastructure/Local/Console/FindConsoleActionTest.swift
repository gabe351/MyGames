//
//  FindConsoleActionTest.swift
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

class FindConsoleActionTest: QuickSpec {
    
    override func spec() {
        
        realmDeleteIfMigrationNeeded()
        
        beforeSuite {
            realmInMemoryIdentifierConfig(name: self.name)
        }
        
        beforeEach {
            realmClean()
        }
                        
        describe("#find") {
            
            let realm = realmInstance()
            
            let localDataSource = ConsoleLocalDataSourceImpl
                .getInstance(realm: realm)
            
            let firstGuid  = GuidGenerator.generate()
            let secondGuid = GuidGenerator.generate()
            let thirdGuid  = GuidGenerator.generate()
            
            var result: Console?
            
            let findAction: Action = Action() {
                result = localDataSource.findBy(guid: firstGuid)
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
                
                it("Should return found object") {
                    expect(result?.guid).to(equal(firstGuid))
                }
            }
            
            context("When do not have saved objects") {
                
                beforeEach {
                    execute(action: findAction) {}
                }
                
                it("Should return empty object") {
                    expect(result?.guid).to(beEmpty())
                }
            }
        }
    }
}



