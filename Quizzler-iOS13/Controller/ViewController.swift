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
    @IBOutlet weak var storyBoard: UIStackView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = "Welcome, Hit buttons to start."
        resetUIs()
    }

    
    
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        let result = quizBrain.buttonPressed(sender.currentTitle)
        
        questionLabel.text = result.text
        
        if result.isCorrect == true {
            sender.backgroundColor = UIColor.green
        } else if result.isCorrect == false {
            sender.backgroundColor = UIColor.red
        } else {
            print("Quiz Started!")
        }
        
        if result.progress == 0 {
            quizBrain.resetQuiz()
        }

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(resetUIs), userInfo: nil, repeats: false)
    }
     
    @objc func resetUIs() {
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.score)"
    }
    
    
}

