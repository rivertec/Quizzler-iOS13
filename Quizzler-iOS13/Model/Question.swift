//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Garam kim on 9/23/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var text : String
    var answer : String
    var correctA : String?
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}

struct Progression {
    var text : String
    var answer : String
    var isCorrect : Bool?
    var progress : Int?
    
    init(q: String, a: String, c: Bool?, p: Int?){
        text = q
        answer = a
        isCorrect = c
        progress = p
    }
}
