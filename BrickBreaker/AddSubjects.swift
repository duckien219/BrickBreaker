//
//  Bricks.swift
//  BrickBreaker
//
//  Created by Kien Nguyen Duc on 6/16/17.
//  Copyright © 2017 Kien Nguyen. All rights reserved.
//

import UIKit

class AddSubjects: UIView {
    var brick = UIImageView()
    var bricks = [UIImageView]()
    var brickOut = UIImageView()
    var margin: CGFloat = 10
    var pad = UILabel()
    var ball = UIImageView()
    var ballRadius: CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addBrick()
        addBall()
        addPad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func addBrick() {
        for indexHang in 0...2 {
            for indexCot in 0...2 {
                
                brick = UIImageView(frame: CGRect(x: margin * CGFloat(indexCot + 1) + ((frame.width-40)/3 ) * CGFloat(indexCot), y: (margin + 20) * CGFloat(indexHang + 1 ) + CGFloat(30 * indexHang), width: ((frame.width-40)/3 ), height: 30))
                brick.backgroundColor = UIColor.red
                bricks.append(brick)
                self.addSubview(brick)
                
            }
        }
        brickOut = UIImageView(frame: CGRect(x: frame.width + 200, y: 100, width: 10, height: 10))
        self.addSubview(brickOut)
        
    }
    
    
    func addBall() {
        ball = UIImageView(frame: CGRect(x: frame.width/2 - 15, y: frame.height - 70 , width: 30, height: 30))
        ball.image = UIImage(named: "ball.png")
        ballRadius = 15
        
        self.addSubview(ball)
        
    }
    
    func addPad() {
        pad = UILabel(frame: CGRect(x: frame.width/2 - 50 , y: frame.height - 40, width: 100, height: 20))
        pad.layer.backgroundColor = UIColor.green.cgColor
        self.addSubview(pad)
    }
    
}
