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
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetUIs(quizBrain.defaultSet)
        
    }

    
    
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        let result = quizBrain.buttonPressed(sender.currentTitle)
                
        if result.isCorrect == true {
            sender.backgroundColor = UIColor.green
        } else if result.isCorrect == false {
            sender.backgroundColor = UIColor.red
        } else {
            print("Quiz Started!")
        }
        
        if result.progress == nil {
            quizBrain.resetQuiz()
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { [self] timer in
            resetUIs(result)
        }
    }
     
    func resetUIs(_ sets: Progression) {
        questionLabel.text = sets.text

        for i in 0...2 {
            let btnSets = [button1, button2, button3]
            if sets.answer[i] != "" {
                btnSets[i]?.alpha = 1
                btnSets[i]?.setTitle(sets.answer[i], for: .normal)
                btnSets[i]?.backgroundColor = UIColor.clear
            } else {
                btnSets[i]?.alpha = 0
            }
        }
        
        if sets.progress == nil {
            scoreLabel.text = ""
            progressBar.progress = 1
        } else {
            scoreLabel.text = "Score: \(quizBrain.score)"
            progressBar.progress = quizBrain.getProgress()
        }
    }
}

