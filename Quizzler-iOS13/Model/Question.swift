//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Dmitriy on 3/8/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], c: String) {
        self.text = q
        self.answers = a
        self.correctAnswer = c
    }
}
