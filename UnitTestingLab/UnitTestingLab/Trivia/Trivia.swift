//
//  Trivia.swift
//  UnitTestingLab
//
//  Created by David Lin on 12/5/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import Foundation

struct Trivia: Codable {
    let results: [TriviaData]
}


struct TriviaData: Codable {
    let category: String
    let question: String
    let correctAnswer: String
    let incorrectAnswer: [String]
    
    enum CodingKeys: String, CodingKey {
        case category
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswer = "incorrect_answer"
    }
}

extension TriviaData {
    static func getTrivia() -> [TriviaData] {
    var trivia = [TriviaData]()
    
    guard let fileURL = Bundle.main.url(forResource: "trivia", withExtension: "json") else {
    fatalError("")
    }
    
    do {
    let data = try Data(contentsOf: fileURL)
    let triviaData = try JSONDecoder().decode(Trivia.self, from: data)
    trivia = triviaData.results
    } catch {
        fatalError("")
        }
     return trivia
    }
}
