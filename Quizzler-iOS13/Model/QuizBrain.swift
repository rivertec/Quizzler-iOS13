//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Garam kim on 9/23/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    let defaultSet =  Progression(q: "Welcome!, Hit Button to Start.", a: ["Here!", "", ""], c: nil, p: 0)
    
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
    
    var progress = 0
    var score = 0
    var answer: String? = nil
    
    mutating func buttonPressed(_ userAnswer: String!) -> Progression {
        
        let currentProgress = progress
                
        progress += 1
        
        if currentProgress == 0 {
            let currentQuiz = quiz[currentProgress]
            answer = currentQuiz.correctA
            return Progression(q: currentQuiz.text, a: currentQuiz.answer, c: nil, p: progress)
            
        } else if currentProgress < quiz.count {
            let currentQuiz = quiz[currentProgress]
            print("\(currentProgress). current score is \(score)")

            return Progression(q: currentQuiz.text, a: currentQuiz.answer, c: checkTheAnswer(userAnswer), p: progress)
            
        } else {
            if answer == userAnswer {
                score += 1
                return Progression(q: "Done! Your Score is \(score)", a: ["Restart", "", ""], c: true, p: nil)
            } else {
                return Progression(q: "Done! Your Score is \(score)", a: ["Restart", "", ""], c: true, p: nil)
            }
        }
    }
    
    mutating func checkTheAnswer(_ userAnswer: String) -> Bool {
        if answer == userAnswer {
            score += 1
            answer = quiz[progress - 1].correctA
            return true
        } else {
            answer = quiz[progress - 1].correctA
            return false
        }
    }
    
    mutating func resetQuiz() {
        progress = 0
        score = 0
        answer = nil
    }
    
    func getProgress() -> Float {
        return Float(progress) / Float(quiz.count)
    }
}
