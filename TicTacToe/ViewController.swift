//
//  ViewController.swift
//  TicTacToe
//
//  Created by Narumi Nogawa on 2019/08/23.
//  Copyright © 2019 Narumi Nogawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //player1: 1, player2: 2, other: 0.
    var activePlayer = 1
    //field information
    var fieldState = [0,0,0,0,0,0,0,0,0]
    //winning pattern
    var winPattern = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var image = UIImage(named: "Circle.png");
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

