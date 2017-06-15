//
//  ViewController.swift
//  BrickBreaker
//
//  Created by Kien Nguyen Duc on 6/14/17.
//  Copyright © 2017 Kien Nguyen. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    var brick = UILabel()
    var pad = UILabel()
    var ball = UIImageView()
    var ballRadius: Int!
    var time = Timer()
    var direction: CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        direction = 5
        addPad()
        addBall()
        
        
//        addBrick()
        
        
        time = Timer.scheduledTimer(timeInterval: 0.009, target: self, selector: #selector(moveBall) , userInfo: nil, repeats: true)
        let padGesture = UIPanGestureRecognizer(target: self, action: #selector(onPad))
        pad.isUserInteractionEnabled = true
        pad.addGestureRecognizer(padGesture)
    }
    
    func addPad() {
        pad = UILabel(frame: CGRect(x: view.bounds.size.width/2 - 50 , y: view.bounds.size.height - 40, width: 100, height: 20))
        pad.layer.backgroundColor = UIColor.green.cgColor
        self.view.addSubview(pad)
    }
    
    //di chuyển thanh Pad
    func onPad(padGesture: UIPanGestureRecognizer){
        if (padGesture.state == .began || padGesture.state == .changed ){
            let point = padGesture.location(in: self.view)
            self.pad.center = CGPoint (x: point.x, y:pad.center.y)
        }
    }
    
    
    func addBall() {
        ball = UIImageView(frame: CGRect(x: view.bounds.size.width/2 - 15, y: view.bounds.size.height - 70 , width: 30, height: 30))
        ball.image = UIImage(named: "ball.png")
        ballRadius = 15
        self.view.addSubview(ball)
    }
    
//    func addBrick() {
//        brick = UILabel(frame: CGRect(x: view.bounds.size.width/2 - 50 , y: 20, width: 100, height: 20))
//        brick.layer.backgroundColor = UIColor.cyan.cgColor
//        self.view.addSubview(brick)
//        
//        
//        
//    }
    
    
    func moveBall() {
        
        ball.center = CGPoint(x: ball.center.x, y: ball.center.y - CGFloat(direction))
        
        
        if (ball.center.y < CGFloat(ballRadius )) {
            
            direction = -direction
        }
        if (ball.center.y > view.bounds.size.height - 60) {
            direction = -direction
        }
    }
    
    func makeRandom() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX))
    }
    
    
    
    
    
    
    
    
    
    
    
}

