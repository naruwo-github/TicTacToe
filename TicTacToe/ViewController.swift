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
    var image = UIImage(named: "Circle3");
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        drawSquares()
        setButtons()
        //print(image!)
    }
    
    //draw squares
    func drawSquares() {
        let drawView = DrawView(frame: self.view.bounds)
        self.view.addSubview(drawView)
    }
    
    func setButtons() {
        let w = self.view.frame.width
        let h = self.view.frame.height
        
        let button0 = UIButton(type: UIButton.ButtonType.system)
        button0.tag = 0
        button0.addTarget(self, action: #selector(resetButtonTapped(_:)), for: UIControl.Event.touchUpInside)
        button0.setTitle("RESET", for: UIControl.State.normal)
        button0.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button0.backgroundColor = UIColor.gray
        button0.layer.cornerRadius = 25
        button0.layer.shadowOpacity = 0.5
        button0.layer.shadowOffset = CGSize(width: 2, height: 2)
        button0.frame = CGRect(x: 0, y: 0, width: w / 3, height: w / 6)
        button0.center = CGPoint(x: w / 2, y: h / 2 + w / 3 * 2)
        self.view.addSubview(button0)
        
        let button1 = UIButton(type: UIButton.ButtonType.system)
        button1.tag = 1
        button1.addTarget(self, action: #selector(cellButtonTapped(_:)), for: UIControl.Event.touchUpInside)
        button1.setTitle("", for: UIControl.State.normal)
        button1.frame = CGRect(x: 0, y: 0, width: w / 3, height: w / 3)
        button1.center = CGPoint(x: w / 6, y: h / 2 - w / 3)
        self.view.addSubview(button1)
        
        let button2 = UIButton(type: UIButton.ButtonType.system)
        button2.tag = 2
        button2.addTarget(self, action: #selector(cellButtonTapped(_:)), for: UIControl.Event.touchUpInside)
        button2.setTitle("", for: UIControl.State.normal)
        button2.frame = CGRect(x: 0, y: 0, width: w / 3, height: w / 3)
        button2.center = CGPoint(x: w / 6, y: h / 2)
        self.view.addSubview(button2)
        
        let button3 = UIButton(type: UIButton.ButtonType.system)
        button3.tag = 3
        button3.addTarget(self, action: #selector(cellButtonTapped(_:)), for: UIControl.Event.touchUpInside)
        button3.setTitle("", for: UIControl.State.normal)
        button3.frame = CGRect(x: 0, y: 0, width: w / 3, height: w / 3)
        button3.center = CGPoint(x: w / 6, y: h / 2 + w / 3)
        self.view.addSubview(button3)
        
        let button4 = UIButton(type: UIButton.ButtonType.system)
        button4.tag = 4
        button4.addTarget(self, action: #selector(cellButtonTapped(_:)), for: UIControl.Event.touchUpInside)
        button4.setTitle("", for: UIControl.State.normal)
        button4.frame = CGRect(x: 0, y: 0, width: w / 3, height: w / 3)
        button4.center = CGPoint(x: w / 2, y: h / 2 - w / 3)
        self.view.addSubview(button4)
        
        let button5 = UIButton(type: UIButton.ButtonType.system)
        button5.tag = 5
        button5.addTarget(self, action: #selector(cellButtonTapped(_:)), for: UIControl.Event.touchUpInside)
        button5.setTitle("", for: UIControl.State.normal)
        button5.frame = CGRect(x: 0, y: 0, width: w / 3, height: w / 3)
        button5.center = CGPoint(x: w / 2, y: h / 2)
        self.view.addSubview(button5)
        
        let button6 = UIButton(type: UIButton.ButtonType.system)
        button6.tag = 6
        button6.addTarget(self, action: #selector(cellButtonTapped(_:)), for: UIControl.Event.touchUpInside)
        button6.setTitle("", for: UIControl.State.normal)
        button6.frame = CGRect(x: 0, y: 0, width: w / 3, height: w / 3)
        button6.center = CGPoint(x: w / 2, y: h / 2 + w / 3)
        self.view.addSubview(button6)
        
        let button7 = UIButton(type: UIButton.ButtonType.system)
        button7.tag = 7
        button7.addTarget(self, action: #selector(cellButtonTapped(_:)), for: UIControl.Event.touchUpInside)
        button7.setTitle("", for: UIControl.State.normal)
        button7.frame = CGRect(x: 0, y: 0, width: w / 3, height: w / 3)
        button7.center = CGPoint(x: w / 6 * 5, y: h / 2 - w / 3)
        self.view.addSubview(button7)
        
        let button8 = UIButton(type: UIButton.ButtonType.system)
        button8.tag = 8
        button8.addTarget(self, action: #selector(cellButtonTapped(_:)), for: UIControl.Event.touchUpInside)
        button8.setTitle("", for: UIControl.State.normal)
        button8.frame = CGRect(x: 0, y: 0, width: w / 3, height: w / 3)
        button8.center = CGPoint(x: w / 6 * 5, y: h / 2)
        self.view.addSubview(button8)
        
        let button9 = UIButton(type: UIButton.ButtonType.system)
        button9.tag = 9
        button9.addTarget(self, action: #selector(cellButtonTapped(_:)), for: UIControl.Event.touchUpInside)
        button9.setTitle("", for: UIControl.State.normal)
        button9.frame = CGRect(x: 0, y: 0, width: w / 3, height: w / 3)
        button9.center = CGPoint(x: w / 6 * 5, y: h / 2 + w / 3)
        self.view.addSubview(button9)
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
    
    //cell
    @IBAction func cellButtonTapped(_ sender: UIButton) {
        if fieldState[sender.tag-1] == 0 && playing {
            fieldState[sender.tag-1] = activePlayer
            
            if activePlayer == 1 {
                image = UIImage(named: "Circle3")
                activePlayer = 2
            }else if activePlayer == 2 {
                image = UIImage(named: "Cross3")
                activePlayer = 1
            }
            
            sender.setBackgroundImage(image, for: .normal)
            print(sender.tag)
        }
        
        for pattern in winPattern {
            if fieldState[pattern[0]] != 0 && fieldState[pattern[0]] == fieldState[pattern[1]] && fieldState[pattern[0]] == fieldState[pattern[2]]{
                print("fin")
                
                //endView
                let buttleView = UIView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
                var text: String = "Finish!!"
                //buttleView.addSubview(text)
                
                if fieldState[pattern[0]] == 1{
                    print("Player1 won!!")
                    
                    self.view.addSubview(buttleView)
                    
                } else if fieldState[pattern[0]] == 2{
                    print("Player2 won!!")
                    
                }
                playing = false
            }
            
        }
    }
}

class DrawView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.backgroundColor = UIColor.clear;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // BezierPath codes bellow
        let line0 = UIBezierPath()
        line0.move(to: CGPoint(x: 0, y: self.frame.height / 2 - self.frame.width / 2))
        line0.addLine(to:CGPoint(x: self.frame.width, y: self.frame.height / 2 - self.frame.width / 2))
        line0.close()
        UIColor.gray.setStroke()
        line0.lineWidth = 5.0
        line0.stroke()
        
        let line1 = UIBezierPath()
        line1.move(to: CGPoint(x: 0, y: self.frame.height / 2 - self.frame.width / 6))
        line1.addLine(to:CGPoint(x: self.frame.width, y: self.frame.height / 2 - self.frame.width / 6))
        line1.close()
        UIColor.gray.setStroke()
        line1.lineWidth = 5.0
        line1.stroke()
        
        let line2 = UIBezierPath()
        line2.move(to: CGPoint(x: 0, y: self.frame.height / 2 + self.frame.width / 6))
        line2.addLine(to:CGPoint(x: self.frame.width, y: self.frame.height / 2 + self.frame.width / 6))
        line2.close()
        UIColor.gray.setStroke()
        line2.lineWidth = 5.0
        line2.stroke()
        
        let line3 = UIBezierPath()
        line3.move(to: CGPoint(x: 0, y: self.frame.height / 2 + self.frame.width / 2))
        line3.addLine(to:CGPoint(x: self.frame.width, y: self.frame.height / 2 + self.frame.width / 2))
        line3.close()
        UIColor.gray.setStroke()
        line3.lineWidth = 5.0
        line3.stroke()
        
        let column0 = UIBezierPath()
        column0.move(to: CGPoint(x: 0, y: self.frame.height / 2 - self.frame.width / 2))
        column0.addLine(to: CGPoint(x: 0, y: self.frame.height / 2 + self.frame.width / 2))
        column0.close()
        UIColor.gray.setStroke()
        column0.lineWidth = 5.0
        column0.stroke()
        
        let column1 = UIBezierPath()
        column1.move(to: CGPoint(x: self.frame.width / 3, y: self.frame.height / 2 - self.frame.width / 2))
        column1.addLine(to: CGPoint(x: self.frame.width / 3, y: self.frame.height / 2 + self.frame.width / 2))
        column1.close()
        UIColor.gray.setStroke()
        column1.lineWidth = 5.0
        column1.stroke()
        
        let column2 = UIBezierPath()
        column2.move(to: CGPoint(x: self.frame.width / 3 * 2, y: self.frame.height / 2 - self.frame.width / 2))
        column2.addLine(to: CGPoint(x: self.frame.width / 3 * 2, y: self.frame.height / 2 + self.frame.width / 2))
        column2.close()
        UIColor.gray.setStroke()
        column2.lineWidth = 5.0
        column2.stroke()
        
        let column3 = UIBezierPath()
        column3.move(to: CGPoint(x: self.frame.width, y: self.frame.height / 2 - self.frame.width / 2))
        column3.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height / 2 + self.frame.width / 2))
        column3.close()
        UIColor.gray.setStroke()
        column3.lineWidth = 5.0
        column3.stroke()
    }
    
}
