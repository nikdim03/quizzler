//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = quizBrain.getQuestionText()
        topButton.setTitle(quizBrain.getAnswers(1), for: .normal)
        middleButton.setTitle(quizBrain.getAnswers(2), for: .normal)
        bottomButton.setTitle(quizBrain.getAnswers(3), for: .normal)
        scoreLabel.text = quizBrain.getScore()
        progressBar.progress = quizBrain.getProgress()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { [self] (_) in
            sender.backgroundColor = UIColor.clear
            questionLabel.text = quizBrain.getQuestionText()
            topButton.setTitle(quizBrain.getAnswers(1), for: .normal)
            middleButton.setTitle(quizBrain.getAnswers(2), for: .normal)
            bottomButton.setTitle(quizBrain.getAnswers(3), for: .normal)
            scoreLabel.text = quizBrain.getScore()
            progressBar.progress = quizBrain.getProgress()
        }
    }
}
