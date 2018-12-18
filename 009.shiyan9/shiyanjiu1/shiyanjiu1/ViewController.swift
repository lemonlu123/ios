//
//  ViewController.swift
//  shiyanjiu1
//
//  Created by 客人用户 on 2018/12/18.
//  Copyright © 2018年 yanlu. All rights reserved.
//

import UIKit
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @objc func tap(recognizer: UITapGestureRecognizer) {
        if recognizer.state == .recognized {
            recognizer.view?.removeFromSuperview()
        }
    }
    @objc func pan(recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .changed  || recognizer.state == .ended {
            let translation = recognizer.translation(in: self.view)
            recognizer.view?.center.x += translation.x
            recognizer.view?.center.y += translation.y
            recognizer.setTranslation(.zero, in: self.view)
        }
    }
    
    @IBAction func add(_ sender: Any) {
        let x = Int(arc4random()) % Int(self.view.bounds.width)
        let y = Int(arc4random()) % Int(self.view.bounds.height)
        
        let label = UILabel(frame: CGRect(x: x, y: y, width: 30, height: 30))
        label.textAlignment = .center
        label.backgroundColor = UIColor.red
        label.layer.shadowColor = UIColor.black.cgColor
        label.text = "A"
        label.layer.shadowOffset = CGSize(width: 10, height: 10)
        label.layer.shadowOpacity = 1
        
        let pR = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        label.addGestureRecognizer(pR)
        label.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self,action: #selector(tap(recognizer:)))
        label.addGestureRecognizer(tapRecognizer)
        tapRecognizer.numberOfTapsRequired = 1
        
        self.view.addSubview(label)
        
    }
    @IBAction func move(_ sender: Any) {
        for label in self.view.subviews {
            if label is UILabel {
                UIView.animate(withDuration: 1) {
                    let x = Int(arc4random()) % Int(self.view.bounds.width)
                    
                    let y = Int(arc4random()) % Int(self.view.bounds.height)
                    
                    label.center = CGPoint(x: x, y: y)
                }
            }
        }
        
    }
    @IBAction func deletevi(_ sender: Any) {
        for label in self.view.subviews {
            if label is UILabel {
                label.removeFromSuperview()
            }
        }
        
    }
    
}



