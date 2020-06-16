//
//  ViewController.swift
//  HackingWithSwift
//
//  Created by Ivan Terziev on 15.06.20.
//  Copyright © 2020 Ivan Terziev. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    // MARK: - Properties
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    var countries = [String]()
    var currentFlags = [String]()
    var score = 0
    var correctAnswer = 0
    var answered = 0
    
    
    
    // MARK: - App lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
    }
    
    
    // MARK: - Methods
    func askQuestion(action: UIAlertAction! = nil) {
        
        // Set the borderWidth
        firstButton.layer.borderWidth = 1
        secondButton.layer.borderWidth = 1
        thirdButton.layer.borderWidth = 1
        
        firstButton.layer.borderColor = UIColor.black.cgColor
        secondButton.layer.borderColor = UIColor.black.cgColor
        thirdButton.layer.borderColor = UIColor.black.cgColor
        
        // Shuffle the array
        countries.shuffle()
        print(countries)
        currentFlags = [countries[0], countries[1], countries[2]]
        print(currentFlags)
        
        // Choose the correct answer
        correctAnswer = Int.random(in: 0...2)
        
        // Set the image
        firstButton.setImage(UIImage(named: currentFlags[0]), for: .normal)
        secondButton.setImage(UIImage(named: currentFlags[1]), for: .normal)
        thirdButton.setImage(UIImage(named: currentFlags[2]), for: .normal)
        
        title = ("\(countries[correctAnswer].uppercased()), Your score is \(score)")
    }
    
    // One of the buttons is tapped
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong, this is the flag of \(currentFlags[sender.tag].uppercased())"
            score -= 1
        }
        
        answered += 1
        
        // Create the alert
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        if answered < 10 {
            
            ac.addAction(UIAlertAction(title: "Countinue", style: .default, handler: askQuestion))
            present(ac, animated: true)
            
        } else if answered == 10 {
            present(ac, animated: true)
        }
    }
}
