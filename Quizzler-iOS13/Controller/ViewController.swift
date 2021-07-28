//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Link all your UI elements to an outlet where we can make changes.
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    
    
    var quizBrain = QuizBrain() //creating an instance from a structure
    
    override func viewDidLoad() { //what you wanna do when your screen first load up
        super.viewDidLoad()
        // All these codes only triggered once when it loads up
        updateUI()
    }
    //execute codes whenever the button is pressed
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //returns a,b,c //! turns it from optional String to String type
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            print("Correct!")
            sender.backgroundColor = UIColor.green
        } else {
            print("Wrong!")
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion() //to go to next question using the MVC design pattern.
        
        //updateUI() //update the question shown on the screen.
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        // Need to fetch the answers and update the button titles using the setTitle method.
        let answerChoices = quizBrain.getAnswers()
        aButton.setTitle(answerChoices[0], for: .normal)
        bButton.setTitle(answerChoices[1], for: .normal)
        cButton.setTitle(answerChoices[2], for: .normal)
        
        
        //reset the background color of the button.
        aButton.backgroundColor = UIColor.clear
        bButton.backgroundColor = UIColor.clear
        cButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
}

