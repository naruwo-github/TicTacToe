//
//  ViewController.swift
//  TicTacToe
//
//  Created by Narumi Nogawa on 2019/08/23.
//  Copyright © 2019 Narumi Nogawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //playing frag
    var playing = true
    //player1: 1, player2: 2, other: 0.
    var activePlayer = 1
    //field information
    var fieldState = [0,0,0,0,0,0,0,0,0]
    //winning pattern
    var winPattern = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var image = UIImage(named: "Circle");
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //print(image!)
    }
    
    //reset button
    @IBAction func resetButtonTapped(_ sender: Any) {
        activePlayer = 1
        
        fieldState = [0,0,0,0,0,0,0,0,0]
        
        playing = true
        
        for i in 1..<10 {
            if let button = self.view.viewWithTag(i) as? UIButton
            {
                print(i)
                button.setBackgroundImage(nil, for: .normal)
            }
            //button = view.viewWithTag(i) as! UIButton
            //button.setBackgroundImage(nil, for: .normal)
        }
        
    }
    
    @IBAction func cellButtonTapped(_ sender: UIButton) {
        if fieldState[sender.tag-1] == 0 && playing {
            fieldState[sender.tag-1] = activePlayer
            
            if activePlayer == 1 {
                image = UIImage(named: "Circle")
                activePlayer = 2
            }else if activePlayer == 2 {
                image = UIImage(named: "Cross")
                activePlayer = 1
            }
            
            sender.setBackgroundImage(image, for: .normal)
            print(sender.tag)
        }
        
        for pattern in winPattern {
            if fieldState[pattern[0]] != 0 && fieldState[pattern[0]] == fieldState[pattern[1]] && fieldState[pattern[0]] == fieldState[pattern[2]]{
                print("fin")
                
                if fieldState[pattern[0]] == 1{
                    //winLabel.alpha = 1
                    //winLabel.text = "Twitter won!!"
                    print("Player1 won!!")
                    
                } else if fieldState[pattern[0]] == 2{
                    //winLabel.alpha = 1
                    //winLabel.text = "LINE won!!"
                    print("Player2 won!!")
                    
                }
                playing = false
            }
            
        }
    }
}

