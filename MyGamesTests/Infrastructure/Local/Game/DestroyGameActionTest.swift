//
//  DestroyGameActionTest.swift
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

class DestroyGameActionTest: QuickSpec {
    
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
            
            let localDataSource = GameLocalDataSourceImpl
                .getInstance(realm: realm)
            
            let firstGuid  = GuidGenerator.generate()
            let secondGuid = GuidGenerator.generate()
            let thirdGuid  = GuidGenerator.generate()
            
            var result     = [GameEntry]()
            
            let findAction: Action = Action() {
                result = Array(realm.objects(GameEntry.self))
            }
            
            context("When have saved objects") {
                
                beforeEach {
                    execute(action: findAction) {
                        writeOnRealm() { (realm) in
                            realm.add(GameBuilder.buildEntryWith(firstGuid))
                            realm.add(GameBuilder.buildEntryWith(secondGuid))
                            realm.add(GameBuilder.buildEntryWith(thirdGuid))
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


