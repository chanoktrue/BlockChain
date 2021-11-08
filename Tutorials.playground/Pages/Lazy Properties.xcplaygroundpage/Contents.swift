//: [Previous](@previous)

import UIKit
import Darwin

enum Level {
    case easy, medium, hard
}

struct Exam {
    var level: Level
    
    var questions: [String] {
        
        sleep(5)
        
        switch level {
            case .easy:
                return ["2+2", "1+1"]
            case .medium:
                return ["12+22", "31+41"]
            case .hard:
                return ["122+242", "351+411"]
        }
    }
}


var exam = Exam(level: .easy)
print(exam.questions)

var hardExam = exam
hardExam.level = .hard

print("wait for 1 second")
sleep(1)

print(exam.questions)
print(hardExam.questions)

//: [Next](@next)
