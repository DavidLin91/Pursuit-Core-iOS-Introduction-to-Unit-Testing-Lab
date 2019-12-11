//
//  JokesTest.swift
//  UnitTestingLabTests
//
//  Created by David Lin on 12/11/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import XCTest

@testable import UnitTestingLab

class JokesTest: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testJokesCount() {
        let sut = JokesVC()
        let expectedResult = 10
        
    }
    
    func testJokePopulation() {
        let jsonData = """
        [
          {
          "id": 18,
          "type": "programming",
          "setup": "Why did the programmer quit his job?",
          "punchline": "Because he didn't get arrays."
        },
        {
          "id": 35,
          "type": "programming",
          "setup": "Why do Java programmers wear glasses?",
          "punchline": "Because they don't C#"
        }]
        """.data(using: .utf8)!
        let expectedJokesCount = 2
        
        do {
            let jokes = try JSONDecoder().decode([AllJokes].self, from: jsonData)
            XCTAssertEqual(jokes.count, expectedJokesCount, "there should be \(expectedJokesCount) created")
        } catch {
            XCTFail("decoding error: \(error)")
            
        }
    }
}


