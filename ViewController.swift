//
//  ViewController.swift
//  TriviaApp
//
//

import UIKit

struct TriviaQuestion {
    let question: String
    let answers: [String]
    let correctAnswer: String
}

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!

    var questions: [TriviaQuestion] = [
        TriviaQuestion(
            question: "What is the capital of North Carolina?",
            answers: ["Charlotte", "Raleigh", "Durham", "Greensboro"],
            correctAnswer: "Raleigh"
        ),
        TriviaQuestion(
            question: "Which planet is known as the Red Planet?",
            answers: ["Earth", "Mars", "Venus", "Jupiter"],
            correctAnswer: "Mars"
        ),
        TriviaQuestion(
            question: "What language is used for iOS apps?",
            answers: ["Swift", "Python", "HTML", "Java"],
            correctAnswer: "Swift"
        )
    ]

    var currentQuestionIndex = 0
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }

    func showQuestion() {
        let currentQuestion = questions[currentQuestionIndex]

        questionLabel.text = currentQuestion.question

        answerButton1.setTitle(currentQuestion.answers[0], for: .normal)
        answerButton2.setTitle(currentQuestion.answers[1], for: .normal)
        answerButton3.setTitle(currentQuestion.answers[2], for: .normal)
        answerButton4.setTitle(currentQuestion.answers[3], for: .normal)
    }

    @IBAction func answerTapped(_ sender: UIButton) {

        let selectedAnswer = sender.currentTitle
        let correctAnswer = questions[currentQuestionIndex].correctAnswer

        if selectedAnswer == correctAnswer {
            score += 1
        }

        currentQuestionIndex += 1

        if currentQuestionIndex < questions.count {
            showQuestion()
        } else {
            questionLabel.text = "Game Over! Score: \(score)"

            answerButton1.isHidden = true
            answerButton2.isHidden = true
            answerButton3.isHidden = true
            answerButton4.isHidden = true
        }
    }
}
