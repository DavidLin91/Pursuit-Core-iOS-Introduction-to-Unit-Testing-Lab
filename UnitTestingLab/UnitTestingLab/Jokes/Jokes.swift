//
//  Jokes.swift
//  UnitTestingLab
//
//  Created by David Lin on 12/5/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import Foundation

struct AllJokes: Codable {
    
    let id: Int
    let type: String
    let setup: String
    let punchline: String
}

extension AllJokes {
    static func getJokes() -> [AllJokes] {
        var jokesArr = [AllJokes]()
        
        guard let fileURL = Bundle.main.url(forResource: "jokes", withExtension: "json") else {
            fatalError()
        }
        do {
            let data = try Data.init(contentsOf: fileURL)
            let jokesData = try JSONDecoder().decode([AllJokes].self, from: data)
            jokesArr = jokesData
        } catch {
            fatalError()
        }
        return jokesArr
        
    }
}
