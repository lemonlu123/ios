//
//  Circle.swift
//  shiyanjiu1
//
//  Created by 客人用户 on 2018/12/18.
//  Copyright © 2018年 yanlu. All rights reserved.
//

import UIKit

class Circle: UIView {
    @IBInspectable var color: UIColor?
    func set() {
        
        let pinchRecognize = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognize:)))
        self.addGestureRecognizer(pinchRecognize)
        
        let panRecognize = UIPanGestureRecognizer(target: self, action: #selector(pan(recognize:)))
        self.addGestureRecognizer(panRecognize)
        
        let tapRecognize = UITapGestureRecognizer(target: self, action: #selector(tap(recognize:)))
        self.addGestureRecognizer(tapRecognize)
        tapRecognize.numberOfTapsRequired = 1
        
    }
    
    @objc func pan(recognize: UIPanGestureRecognizer) {
        if recognize.state == .changed  || recognize.state == .ended {
            let translation = recognize.translation(in: self)
            self.center.x += translation.x
            self.center.y += translation.y
            recognize.setTranslation(.zero, in: self)
        }
    }
    
    @objc func pinch(recognize: UIPinchGestureRecognizer) {
        if recognize.state == .changed  || recognize.state == .ended {
            bounds = CGRect(x: 0, y: 0, width: bounds.width * recognize.scale, height: bounds.height * recognize.scale)
            recognize.scale = 1
            
        }
    }
    
    @objc func tap(recognize: UITapGestureRecognizer) {
        if recognize.state == .recognized {
            print("tap recognized")
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        set()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        set()
    }
    
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        UIColor.red.setStroke()  //红色边界
        path.stroke()
        UIColor.green.setFill()  //填充
        path.fill()
    }
    
    
}
