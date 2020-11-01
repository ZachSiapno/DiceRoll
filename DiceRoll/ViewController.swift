//
//  ViewController.swift
//  DiceRoll
//
//  Created by  on 10/30/20.
//  Copyright © 2020 ZaCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var leftDieImage: UIImageView!
    @IBOutlet weak var rightDieImage: UIImageView!
    
    @IBOutlet weak var leftDieLabel: UILabel!
    @IBOutlet weak var rightDieLabel: UILabel!
    
    
    var wins = 0
    var losses = 0
    
    var leftDie = Dice()
    var rightDie = Dice()
    
    var totalValue = 2
    var gameWin = false
    

    @IBOutlet weak var winLossTracker: UILabel!
    @IBOutlet weak var totalText: UILabel!
    
    
    @IBOutlet weak var predictionTextField: UITextField!
    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var scorePredictionLabel: UILabel!
    
    var predictWin = 0
    var predictLoss = 0
    
    var predictGameWin = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winLossTracker.text = "\(wins) Wins - \(losses) Losses"
        totalText.text = "Sum of Die"
        predictionLabel.text = "Prediction Count"
        scorePredictionLabel.text = "\(predictWin) Correct - \(predictLoss) Incorrect"
//        predictionTextField.keyboardType = UIKeyboardType.numberPad
    }

// Code that has been refactored:
    
//    func winAlert() {
//        let alert = UIAlertController(title: "You Win 🎉🎉🎉", message: "You rolled a winning number", preferredStyle: UIAlertController.Style.alert)
//        let ok = UIAlertAction(title: "Nice!", style: .default) { (action) in
//                print("User Tapped on OK")
//
//        }
//        alert.addAction(ok)
//        self.present(alert, animated: true, completion: nil)
//
//        wins += 1
//    }
//
//    func loseAlert() {
//        let alert = UIAlertController(title: "You Lose 😢", message: "You rolled a losing number", preferredStyle: UIAlertController.Style.alert)
//        let ok = UIAlertAction(title: "Lame", style: .default) { (action) in
//                print("User Tapped on OK")
//
//        }
//        alert.addAction(ok)
//        self.present(alert, animated: true, completion: nil)
//
//        losses += 1
//    }
    
    func winOrLoseAlert(win: Bool) {
        if win == true {
            let alert = UIAlertController(title: "You Win 🎉🎉🎉", message: "You rolled a winning number", preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "Nice!", style: .default) { (action) in
                    print("User Tapped on OK")
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            
            wins += 1
        }
        else {
            let alert = UIAlertController(title: "You Lose 😢", message: "You rolled a losing number", preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "Lame", style: .default) { (action) in
                    print("User Tapped on OK")
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            
            losses += 1
        }
    }
    
    @IBAction func rollDie(_ sender: UIButton) {
        leftDie.roll()
        rightDie.roll()
        
        let leftValue = leftDie.value
        let rightValue = rightDie.value
        
        leftDieLabel.text = "\(leftValue)"
        rightDieLabel.text = "\(rightValue)"
        
        let leftImageName = "dieWhite" + String(leftValue)
        let rightImageName = "dieWhite" + String(rightValue)
        
        leftDieImage.image = UIImage(named: leftImageName)
        rightDieImage.image = UIImage(named: rightImageName)
        
        totalValue = leftValue + rightValue
        totalText.text = "\(totalValue)"
        
        switch totalValue {
        case 2, 3, 12:
            winOrLoseAlert(win: false)
        case 7, 11:
            winOrLoseAlert(win: true)
        default:
            break
        }
        
        winLossTracker.text = "\(wins) Wins - \(losses) Losses"
        
        
        // Stretch 7
        let prediction = predictionTextField.text
        let intPrediction = Int(prediction!)
        
        if prediction == "" {
            predictionLabel.text = "You did not predict."
        } else if intPrediction == totalValue {
            predictionLabel.text = "Your Prediction was Correct"
            predictWin += 1
        }
        else {
            predictionLabel.text = "Your Prediction was Incorrect"
            predictLoss += 1
        }
        scorePredictionLabel.text = "\(predictWin) Correct - \(predictLoss) Incorrect"
    }
    
    // Stretch 6
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        wins = 0
        losses = 0
        winLossTracker.text = "\(wins) Wins - \(losses) Losses"
        
        leftDieLabel.text = "Dice 1"
        rightDieLabel.text = "Dice 2"
        totalText.text = "Sum of Die"
        
        leftDieImage.image = nil
        rightDieImage.image = nil
    
    // Stretch 7.5
        predictWin = 0
        predictLoss = 0
        
        predictionTextField.text = ""
        predictionLabel.text = "Prediction Count"
        scorePredictionLabel.text = "\(predictWin) Correct - \(predictLoss) Incorrect"
        
        
    }
    
    
}

