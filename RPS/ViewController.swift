//
//  ViewController.swift
//  RPS
//
//  Created by Eugene on 20.10.21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var robotLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetButton.isHidden = true
    }
    
    func play(_ sign: Sign) {
        let computerSign = randomSign()
        robotLabel.text = computerSign.emoji
        
        switch sign {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
            
        }
        
        let result = sign.getResult(for: computerSign)
        
        switch result {
        case .win:
            statusLabel.text = "It's a win!"
            self.view.backgroundColor = UIColor.green
        case.lose:
            statusLabel.text = "You lose!"
            self.view.backgroundColor = UIColor.red
        case .start:
            reset()
        case .draw:
            statusLabel.text = "It's a draw!"
            self.view.backgroundColor = UIColor.gray
        }
    }
    
    func reset() {
        statusLabel.text = "Rock, Paper, Scissors?"
        self.view.backgroundColor = UIColor.white
        
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        resetButton.isHidden = true
    }
    
    @IBAction func rockButtonPressed(_ sender: Any) {
        resetButton.isHidden = false
        play(.rock)
    }
    @IBAction func paperButtonPressed(_ sender: Any) {
        resetButton.isHidden = false
        play(.paper)
    }
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        resetButton.isHidden = false
        play(.scissors)
    }
    @IBAction func resetButtonPressed(_ sender: Any) {
        resetButton.isHidden = false
        reset()
    }
    
    
}

