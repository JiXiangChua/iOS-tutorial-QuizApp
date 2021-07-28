//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by JI XIANG on 5/7/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    //text refers to the question
    let text: String
    //Multiple choice questions have multiple answers, an Array of Strings would work for our quiz data.
    let answer: [String]
    //Look at the data in the quiz array, there is a seperate string that is the correctAnswer.
    let rightAnswer: String
    init(q: String, a: [String], correctAnswer: String){
        text = q
        answer = a
        rightAnswer = correctAnswer
    }
}
