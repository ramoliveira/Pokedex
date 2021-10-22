//
//  StatsCalcTests.swift
//  PokedexTests
//
//  Created by Ramon Almeida on 21/10/21.
//

import XCTest

class StatsCalcTests: XCTestCase {
    func hp(base: Double, ev: Double, iv: Double) -> Double {
        return floor(0.01 * (2 * base + iv + floor(0.25 * ev)) * 100) + 100 + 10
    }
    
    func otherStat(base: Double, ev: Double, iv: Double, nature: Double) -> Double {
        return (floor(0.01 * (2 * base + iv + floor(0.25 * ev)) * 100) + 5) * nature
    }
    
    func testMaxHp() {
        let hp = hp(base: 45, ev: 252, iv: 31)
        XCTAssert(hp == 294)
    }
    
    func testMinHp() {
        let hp = hp(base: 45, ev: 0, iv: 0)
        XCTAssert(hp == 200)
    }
    
    func testMaxAttack() {
        let attack = otherStat(base: 49, ev: 252, iv: 31, nature: 1.1).rounded(.down)
        XCTAssert(attack == 216)
    }
    
    func testMinAttack() {
        let attack = otherStat(base: 49, ev: 0, iv: 0, nature: 0.9).rounded(.down)
        XCTAssert(attack == 92)
    }
    
    func testMaxSpAttack() {
        let spAttack = otherStat(base: 65, ev: 252, iv: 31, nature: 1.1).rounded(.down)
        XCTAssert(spAttack == 251)
    }
    
    func testMinSpAttack() {
        let attack = otherStat(base: 65, ev: 0, iv: 0, nature: 0.9).rounded(.down)
        XCTAssert(attack == 121)
    }
    
    func testMaxSpeed() {
        let speed = otherStat(base: 45, ev: 252, iv: 31, nature: 1.1).rounded(.down)
        XCTAssert(speed == 207)
    }
    
    func testMinSpeed() {
        let speed = otherStat(base: 45, ev: 0, iv: 0, nature: 0.9).rounded(.down)
        XCTAssert(speed == 85)
    }
}
