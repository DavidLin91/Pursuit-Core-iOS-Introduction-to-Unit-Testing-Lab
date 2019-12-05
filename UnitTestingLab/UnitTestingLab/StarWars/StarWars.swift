//
//  StarWars.swift
//  UnitTestingLab
//
//  Created by David Lin on 12/5/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import Foundation

struct StarWarsData: Codable {
    let results: [Movies]
}

struct Movies: Codable {
    let title: String
    let opening_crawl: String
}

extension StarWarsData {
    static func getMovies() -> [Movies]{
        var movieArr = [Movies]()
        
        guard let fileURL = Bundle.main.url(forResource: "starWars", withExtension: "json") else {
            fatalError()
        }
        do {
            let data = try Data.init(contentsOf: fileURL)
            let moviesData = try JSONDecoder().decode(StarWarsData.self, from: data)
            movieArr = moviesData.results
        } catch {
            fatalError("\(error)")
        }
        return movieArr
    }
}
