//
//  ViewController.swift
//  Tic Tac Toe Game
//
//  Created by Mandar Choudhary on 07/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet var TicButton: [UIButton]!
    var player1 = true
    let winningScenario: [[Int]] = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var playerBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func onClickResetButton(_ sender: UIButton) {
        
        for ticbtn in TicButton {
            ticbtn.isEnabled = true
            ticbtn.setTitle("btn", for: .normal)
            winnerLabel.text = " New Game "
        }
        playerBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
    
    
    @IBAction func OnClickTicButton(_ sender: UIButton) {
        
       // print("Tic Button clicked",sender.tag)
        if player1 {
            sender.setTitle("X", for: .normal)
            playerBoard[sender.tag - 1] = 1
            player1 = false
        }
        else {
            sender.setTitle("O", for: .normal)
            playerBoard[sender.tag - 1] = 2
            player1 = true
        }
        
        sender.isEnabled = false
        
        for scenario in winningScenario { // [1, 2, 3]
            if (playerBoard[scenario[0]] == playerBoard[scenario[1]] && playerBoard[scenario[1]] == playerBoard[scenario[2]]) {
                if ((playerBoard[scenario[0]]) == 1) {
                    winnerLabel.text = "Player 1 Win"
                    
                    for btn in TicButton {
                        btn.isEnabled = false
                    }
                } else if ((playerBoard[scenario[0]]) == 2) {
                    winnerLabel.text = "Player 2 Win"
                    
                    for btn in TicButton {
                        btn.isEnabled = false
                    }
                }
            }
        }
        
    }
}

