//
//  ViewController.swift
//  BrickBreaker
//
//  Created by Kien Nguyen Duc on 6/14/17.
//  Copyright © 2017 Kien Nguyen. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    //    var brick = UIImageView()
    var pad = UILabel()
    var ball = UIImageView()
    var ballRadius: CGFloat  = 15
    var time = Timer()
    var direction: CGFloat!
    var brick: AddSubjects!
    var right = true
    var points: CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        points = 0
        direction = 5
        brick = AddSubjects(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
        self.view.addSubview(brick)
        ball = brick.ball
        pad = brick.pad
        
        time = Timer.scheduledTimer(timeInterval: 0.009, target: self, selector: #selector(checkCollision) , userInfo: nil, repeats: true)
        
        let padGesture = UIPanGestureRecognizer(target: self, action: #selector(onPad))
        pad.isUserInteractionEnabled = true
        pad.addGestureRecognizer(padGesture)
    }
    
    //di chuyển thanh Pad
    func onPad(padGesture: UIPanGestureRecognizer){
        if (padGesture.state == .began || padGesture.state == .changed ){
            let point = padGesture.location(in: self.view)
            self.pad.center = CGPoint (x: point.x, y:pad.center.y)
        }
    }
    
    
    
    
    func moveBrick( b1:UIImageView,b2: UIImageView ) {
        
        b1.center = b2.center
        
    }
    
    func checkCollision() {
        
        
        moveBall()
        ballToPad()
        
        if (ball.center.y < CGFloat(180 + ballRadius )) {
            if (ball.center.y > ballRadius){
                
                for i in 0...8{
                    
                    if (ball.center.y <= brick.bricks[i].center.y + CGFloat(15+15)
                        && ball.center.x >= (brick.bricks[i].center.x-(view.bounds.size.width-40)/6 - CGFloat(ballRadius))
                        && ball.center.x <= (brick.bricks[i].center.x+(view.bounds.size.width-40)/6 + CGFloat(ballRadius))){
                        moveBrick(b1: brick.bricks[i], b2: brick.brickOut)
                        direction = -direction
                        
                        return
                    }
                }
            }
            else{
                direction = -direction
            }
            
        }
    }
    
    //random ra số có giá trị từ 0 -> 1
    func makeRandom() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX))
    }
    
    //Kiểm tra va chạm giữa quả bóng với thanh Pad
    func ballToPad() {
        
        if (((pad.center.x - ball.center.x) * (pad.center.x - ball.center.x) + (pad.center.y - ball.center.y) * (pad.center.y - ball.center.y)) <= 625 )
        {
            direction = -direction
        }
        
        //Nếu quả bóng không chạm thanh Pad
        if (ball.center.y > view.bounds.size.height)
        {
            print("chạm đáy ")
            right = true
            checkCollision()
            //            ball.center = CGPoint(x: view.bounds.size.width/2, y: view.bounds.size.height - 70)
            
            
        }
    }
    
    func moveBall() {
        
        let dic = makeRandom()
        if (right == true){
            ball.center = CGPoint(x: ball.center.x + dic * ballRadius , y: ball.center.y - dic * CGFloat(direction))
            if (ball.center.x >= (view.bounds.size.width - ballRadius))
            {
                right = false
                ballRadius = -ballRadius
            }
        }
        else{
            ball.center = CGPoint(x: ball.center.x + dic * ballRadius , y: ball.center.y - dic * CGFloat(direction))
            if (ball.center.x <= ballRadius/2 ) {
                ballRadius = -ballRadius
                right = true
            }
        }
        
    }
    func restart() {
        
        
        
        
    }
}

