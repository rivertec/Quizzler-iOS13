//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Garam kim on 9/23/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    var progress = 0
    var score = 0
    var answer: String? = nil
    
    mutating func buttonPressed(_ userAnswer: String!) -> Progression {
        if progress < quiz.count {
            let newSet = setQuestions(userAnswer)
            progress += 1
            print(progress - 1, "current score is ", score)
            return Progression(q: newSet.text, a: newSet.answer, c: newSet.isCorrect, p: newSet.progress)
        } else {
            if checkTheAnswer(userAnswer) == true {
                print("#12 Correct")
            } else {
                print("You missed the Last one")
            }

            let finalScore = score
            
            return Progression(q: "Done! Your Score is " + String(finalScore), a: "", c: checkTheAnswer(userAnswer), p:0)
        }
    }
    
    mutating func setQuestions(_ userAnswer: String) -> Progression {
        if progress == 0 {
            answer = quiz[progress].answer
            return Progression(q: String(progress + 1) + ". " + quiz[progress].text, a: quiz[progress].answer, c: nil, p: 1)
        } else {
            if checkTheAnswer(userAnswer) == true {
                answer = quiz[progress].answer
                return Progression(q: String(progress + 1) + ". " + quiz[progress].text, a: quiz[progress].answer, c: true, p: progress)
            } else {
                answer = quiz[progress].answer
                return Progression(q: String(progress + 1) + ". " + quiz[progress].text, a: quiz[progress].answer, c: false, p: progress)
            }
        }
    }
    
    mutating func checkTheAnswer(_ userAnswer: String) -> Bool {
        if answer == userAnswer {
            score += 1
            return true
        } else {
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
