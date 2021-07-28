//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by JI XIANG on 6/7/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    //Property of struct: quiz, questionNumber
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
        
    ]
    
    var questionNumber = 0
    var score = 0
    
    //method of this structure
    mutating func checkAnswer(_ userAnswer: String) -> Bool {// _ represents no need external parameter name.
        //external parameter name refers to the parameter name that you pass in, when used this function in other files.
        //so now the _ , you dont need to specify the parameter name when used.
        if userAnswer == quiz[questionNumber].rightAnswer {
            //User got it right
            score += 1
            return true
        } else {
            //User got it wrong
            return false
        }
        
    }
    
    func getScore() -> Int{
        return score
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text //.text taps into the value of the question
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    mutating func nextQuestion() { //have to mark this method as mutating so that we can change the property that is inside the structure.
        //In this case, questionNumber is a property of the struct, hence if we want to change the value of this property, we need to mark this method as mutating.
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    func getAnswers() -> [String] {
        return quiz[questionNumber].answer
    }
    
}
