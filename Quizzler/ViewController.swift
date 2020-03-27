//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    var questionNumber: Int = 0
    var score: Int = 0
    let questionPool = QuestionBank()
    var selectedAnswer: Bool = false
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }


    // MARK: Actions
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            selectedAnswer = true
        } else {
            selectedAnswer = false
        }
        
        checkAnswer()
        questionNumber += 1
        updateUI()
        
    }
    
    
    // MARK: Methods
    
    func updateUI() {
        
        
        if questionNumber < 13 {
            
            questionLabel.text = questionPool.list[questionNumber].questionText
            scoreLabel.text = "Score: \(score)"
            progressLabel.text = "\(questionNumber + 1) / 13"
            progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
            
        } else {
            
            showAlert()
            
        }
        

    }
    

    func showAlert() {
        
        // Creating an alert message
        let alert = UIAlertController(title: "Awesome", message: "You've reached to the end of the quizz.", preferredStyle: .alert)
            
        // Creating an alert action
        alert.addAction(UIAlertAction(title: "Start Over", style: .default, handler: { (UIAlertAction) in self.startOver()}))
        
        // Presenting the alert
        present(alert, animated: true, completion: nil)

    }
    
    
    func checkAnswer() {
        
        if selectedAnswer == questionPool.list[questionNumber].answer {
            ProgressHUD.showSuccess("Correct") //3rd party in Objective-C, see "Supporting Files" folder
            score += 1
        } else {
            ProgressHUD.showError("Wrong!") //3rd party in Objective-C, see "Supporting Files" folder
        }
        
    }
    
    
    func startOver() {
       
        questionNumber = 0
        score = 0
        updateUI()
        
    }
    
    
    // MARK: TO DO
    
    /*
    1- Show question in random order each time
    2- Show previous score, and high score
    3- Add alert to "not start over"
    3- Add buttom for starting over
    */
}
