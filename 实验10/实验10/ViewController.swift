//
//  ViewController.swift
//  实验10
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 严璐. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animator: UIDynamicAnimator!
    
    var gravity = UIGravityBehavior()
    var collision = UICollisionBehavior()
    
    var firstView: UIView!
    var secondView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        transition()
        animation()
        UIDynamicAnimtor()
    }
    
    func animation() {
        let view = UIView(frame: CGRect(x: 100, y: 800, width: 100, height: 100))
        view.backgroundColor = UIColor.orange
        self.view.addSubview(view)
        UIView.animate(withDuration: 2, delay: 0, options: [.repeat, .autoreverse], animations: {
            view.frame = CGRect(x: 0, y: 15, width: 8, height: 8)
            view.backgroundColor = UIColor.blue
            view.transform = view.transform.rotated(by: CGFloat.pi)
        }, completion: nil)
    }
    
    func transition() {
        
        let btn = UIButton(frame: CGRect(x: 0, y: 300, width: 100, height: 44))
        btn.setTitle("切换", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        self.view.addSubview(btn)
        
        firstView = UIView(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
        firstView.backgroundColor = UIColor.darkGray
        self.view.addSubview(firstView)
        
        secondView = UIView(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
        secondView.backgroundColor = UIColor.brown
        self.view.addSubview(secondView)
        
    }
    
    @objc func changeView() {
        UIView.transition(from: secondView, to: firstView, duration: 3, options: [.transitionCurlUp], completion: nil)
    }
    
    func UIDynamicAnimtor() {
        animator = UIDynamicAnimator(referenceView: self.view)
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        
        collision.translatesReferenceBoundsIntoBoundary = true
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (t) in
            let x = CGFloat(arc4random() % (UInt32(self.view.frame.width) - 50))
            let view = UIView(frame: CGRect(x: x, y: 20, width: 50, height: 50))
            view.backgroundColor = UIColor.red
            view.layer.borderWidth = 1
            view.layer.cornerRadius = 10
            self.view.addSubview(view)
            
            self.gravity.addItem(view)
            self.collision.addItem(view)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
